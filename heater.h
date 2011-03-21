#ifndef HEATER_H
#define HEATER_H

enum temperature_sensor_type
{
  temperature_sensor_type_thermistor = 0,
  temperature_sensor_type_ad595_thermocouple = 1,
  temperature_sensor_type_max6675_thermocouple = 2
};

char *TEMPERATURE_SENSOR_NAMES[3] = {"thermister", "AD595 thermocouple", "MAX6675 thermocouple"};


typedef enum { pid_p=0, pid_i=1, pid_d=2 } pid;
#define PID_LENGTH (3)
char PID_LETTERS[PID_LENGTH] = {'p', 'i', 'd'};

// the number of heater temperatures to average in the current value.
#define HEATER_HISTORY_LENGTH (5)

#define PID_INTEGRAL_LIMIT (200/0.15)


/* ----------------------
 * Heater data structure
 * ---------------------- */
typedef struct
{

  // Heater Settings
  int heater_pin;
  float pid_gains[PID_LENGTH]; // configurable gain constants for each of proportional integral and derivative.
  
  // Temperature Sensor Settings
  int sensor_pin;
  temperature_sensor_type sensor;
  float thermal_cutoff; // The degrees celcius at which the machine is shut down to prevent overheating.
  ThermisterTemperatureTable* thermister_temp_table; // (thermister only, maps analog values => temperatures in deg. celsius)
  int thermister_temp_table_length;

  // Current values
  float target; // target temperature we are attempting to reach.
  float current; // averaged current temperature.
  float instantaneous; // instantaneous temperature reading (non-averaged).
  float pid_values[PID_LENGTH]; // proportional, integral and derivative values.

  int at_target; // flags that the a steady-state target temperature has been reached (+ or - dead zone / 2 )

  /** Event called each time the temperature stabalizes at or slightly above the target temperature. */
  int (*target_temperature_listener)();

  // Private values
  float _previous_target;
  unsigned long _previous_time; // ms
  unsigned long _target_reached_at; // ms in the time the target temperature deadzone was reached or zero if outside the deadzone
  int _raw_analog_input;

  float _history[HEATER_HISTORY_LENGTH]; // previous temperature values
} Heater;


/* ----------------------
 * Heater functions
 * ---------------------- */

void heater_init(Heater *h);

int heater_update(Heater *h);

void heater_reset(Heater *h);
void heater_shutdown(Heater *h);

char* heater_error_message(Heater *h, int error_code);


/* -------------------------------------
 * Heater error codes returned from update
 * ------------------------------------- */
#define HEATER_OVERHEATED -10
#define HEATER_SENSOR_DISCONNECTED -20
#define HEATER_SENSOR_INTERNAL_ERROR -21
#define HEATER_NOT_HEATING_SENSOR -30

#endif

// MAX6675 Thermocouple pins

//uncomment if not using arduino
/*#if defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
const static uint8_t SS   = 53;
const static uint8_t MOSI = 51;
const static uint8_t MISO = 50;
const static uint8_t SCK  = 52;
#else
const static uint8_t SS   = 10;
const static uint8_t MOSI = 11;
const static uint8_t MISO = 12;
const static uint8_t SCK  = 13;
#endif*/

