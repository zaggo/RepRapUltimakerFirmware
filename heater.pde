#include "thermistor.h"
#include "heater.h"
#include "pins_arduino.h"

void heater_init(Heater *h)
{
  //Setup our pin modes
  pinMode(h->heater_pin, OUTPUT);
  pinMode(h->sensor_pin, INPUT);
  
  analogWrite(h->heater_pin, 0); // heater is off by default
  digitalWrite(h->sensor_pin, false); // pull down resistor for the sensor input

  // Current value defaults
  h->target = h->target||0.0;
  h->current = 0.0;
  for (int i = 0; i<PID_LENGTH; i++)
    h->pid_values[i] = 0.0;
  h->at_target = false;

  // Private variable defaults
  h->_target_reached_at = 0;
  for (int i = 0; i<HEATER_HISTORY_LENGTH; i++)
    h->_history[i] = 0.0;

  // Resetting the rest ofthe heater variables
  heater_reset(h);

}


/*
 * Private: reads the heater pin and returns it's analog value (ranging from zero to 1022). Fails if sensor is disconnected.
 */
int heater_read_raw_sensor_input(Heater *h)
{
  int error_code = 0;
  int raw = analogRead(h->sensor_pin);
  char* sensorName;

  // Fatal error if the thermister is disconnected
  if (raw == 1023 && h->target != 0)
  {
    h->_raw_analog_input = 1023;
    error_code = HEATER_SENSOR_DISCONNECTED;
  }
  else
  {
    //Otherwise set the analog input value
    h->_raw_analog_input = raw;
  }
  return error_code;
}


/*
 * Private: reads and returns the heater's temperature in degrees celsius.
 */
int heater_read_sensor(Heater *h)
{
  int error_code = 0;
  float temperature = 0.0;

  // max 6675 variables
      int value = 0;
      byte error_tc;
      
   // thermister variables
         short** table = h->thermister_temp_table->table;
      int length = h->thermister_temp_table->length;


  switch(h->sensor)
  {
    case temperature_sensor_type_ad595_thermocouple:
      error_code = heater_read_raw_sensor_input(h);
      temperature = ( 5.0 * h->_raw_analog_input * 100.0) / 1024.0;
      break;


    case temperature_sensor_type_max6675_thermocouple:
      digitalWrite(SS, 0); // Enable device

      /* Cycle the clock for dummy bit 15 */
      digitalWrite(SCK,1);
      digitalWrite(SCK,0);

      /* Read bits 14-3 from MAX6675 for the Temp
       	 Loop for each bit reading the value 
       */
      for (int i=11; i>=0; i--)
      {
        digitalWrite(SCK,1);  // Set Clock to HIGH
        value += digitalRead(MISO) << i;  // Read data and add it to our variable
        digitalWrite(SCK,0);  // Set Clock to LOW
      }

      /* Read the TC Input inp to check for TC Errors */
      digitalWrite(SCK,1); // Set Clock to HIGH
      error_tc = digitalRead(MISO); // Read data
      digitalWrite(SCK,0);  // Set Clock to LOW

      digitalWrite(SS, 1); //Disable Device

      if(error_tc)
      {
        temperature = 2000;
        error_code = HEATER_SENSOR_INTERNAL_ERROR;
      }
      else
        temperature = value/4;

      break;


    case temperature_sensor_type_thermistor:
      int n_of_samples = 3;
      int raw = 0;
      
      for(int i = 0; i < n_of_samples; i++)
      {
        error_code = error_code || heater_read_raw_sensor_input(h);
        raw += h->_raw_analog_input;
      }
      
      raw = raw / n_of_samples;

      byte i;

      // TODO: This should do a binary chop
      for (i=1; i<length; i++)
      {
        if (table[i][0] > raw)
        {
          temperature  = table[i-1][1] + 
            (raw - table[i-1][0]) * 
            (table[i][1] - table[i-1][1]) /
            (table[i][0] - table[i-1][0]);

          break;
        }
      }

      // Overflow: Set to last value in the table
      if (i >= length) temperature = table[i-1][1];
      break;
  }

  // Overheating error
  if (temperature > h->thermal_cutoff && h->target != 0) error_code = HEATER_OVERHEATED;
  
  h->instantaneous = temperature;
  
  return error_code;
}


void heater_update_target_temperature_listener(Heater *h)
{
  bool inside_deadzone = ( h->current >= h->target - HALF_DEAD_ZONE );

  if (h->_previous_target != h->target || inside_deadzone == false)
  {
    h->at_target = false;
    h->_target_reached_at = 0;
  }
  h->_previous_target = h->target;

  if(inside_deadzone)
  {
    // reset the timestamp if we have rolled over the timestamp or we he have just reached the target.
    if (h->_target_reached_at == 0 || h->_target_reached_at > h->_previous_time) h->_target_reached_at = h->_previous_time;

    // wait to verify the temperature has stabalized in the deadzone before signalling
    // that we have reached the target temperature.
    if(h->_previous_time - h->_target_reached_at > WAIT_AT_TEMPERATURE)
    {
      h->at_target = true;
      // Fire a target temperature event to signal that we have acheived a steady state temperature.
      if (h->target_temperature_listener != NULL) h->target_temperature_listener();
    }
  }
}



int heater_update(Heater *h)
{
  int error_code = heater_read_sensor(h);
  float temperature = h->instantaneous;

  // Updating the time since the last iteration
  unsigned long time = millis();
  float dt = 0.001*(float)(time - h->_previous_time);
  h->_previous_time = time;
  if (dt <= 0) // Don't do it when millis() has rolled over
    return error_code;


  // Updating the averaged current temperature value. Average is over the last 5 temperature values.
  float history_sum = 0.0;
  for (int i = 0; i<HEATER_HISTORY_LENGTH; i++)
  {
    h->_history[i] = ( i == 0? temperature : h->_history[i-1] );
    history_sum += h->_history[i];
  }
  h->current = history_sum / HEATER_HISTORY_LENGTH;


  // Calculating proportional value (also known as error)
  // -----------------------------------------------------
  h->pid_values[pid_p] = (float)(h->target - temperature);


  // Calculating integral value
  // ----------------------------
  float integral = h->pid_values[pid_i] + h->pid_values[pid_p]*dt;
  // Prevent integral overshoots
  if(integral > E_TEMP_PID_I_LIMIT)
  {
    // Temp isn't increasing - extruder hardware error
    error_code = HEATER_NOT_HEATING_SENSOR;
    integral = E_TEMP_PID_I_LIMIT;
  }
  // Integral below limit (integral wind-down?)
  if(integral < -E_TEMP_PID_I_LIMIT)
  {
    integral = -E_TEMP_PID_I_LIMIT;
  }
  h->pid_values[pid_i] = integral;


  // Calculating derivative value
  // ------------------------------
  h->pid_values[pid_d] = (h->pid_values[pid_p] - ( (float) (h->target - h->_history[0]) ) )/dt;


  // Summing the pid and updating the heater
  // -----------------------------------------
  float _output = 0;
  for (int i = 0; i < PID_LENGTH; i++)
    _output += h->pid_values[i]*h->pid_gains[i];
  
  int output = constrain( (int) _output, 0, 255);

  analogWrite(h->heater_pin, (byte)output);


  // Updating the event listener if we have reached a steady state target temperature
	heater_update_target_temperature_listener(h);
	
	return error_code;
}


/*
 Reset the PID to, for example, remove accumulated integral error from
 a long period when the heater was off and the requested temperature was 0 (which it
 won't go down to, even with the heater off, so the integral error grows).  Call this 
 whenever you change the target value.
*/
void heater_reset(Heater *h)
{
  h->_previous_time = millis();
  h->pid_values[pid_p] = 0;
  h->pid_values[pid_i] = 0;
}


/*
 * Shuts down the heater and frees it's memory for later use.
 */
void heater_shutdown(Heater *h)
{
  if (h == NULL) return;
  analogWrite(h->heater_pin, 0); //good to not leave that heater on fire :)
  free(h);        /* free the structure itself */
  //free(h->data);  /* free any child arrays held by the structure */
}


char* heater_error_message(Heater *h, int error_code)
{
  char* sensor_name = TEMPERATURE_SENSOR_NAMES[h->sensor];
  char* message;

  switch (error_code)
  {
    case 0:
      break;
    case HEATER_OVERHEATED:
      sprintf(message,
        "Temperature above thermal cutoff (extruder overheated) or sensor disconnected. Please fix and reset.");
      break;
    case HEATER_SENSOR_DISCONNECTED:
      sprintf(message, "%d disconnected or broken, please reconnect and reset.", sensor_name);
      break;
    case HEATER_SENSOR_INTERNAL_ERROR:
      sprintf(message,
        "%d internal error. Please verify that the %d is connected and not broken.", sensor_name, sensor_name);
      break;
    case HEATER_NOT_HEATING_SENSOR:
      sprintf(message,
        "Heater is on but the temperature is not increasing. Check that both the heater and %d are connected.", sensor_name);
      break;
    default:
      sprintf(message, "Unexpected error code %d, machine highly broken. Please restart machine.", error_code);
  }
  
  return message;
}
