
/*
 * This controld the heated bed (if any).
 * In a standard Mendel (MOTHERBOARD == 2) this
 * is done by an extruder controller.
 */


#if MOTHERBOARD != 2

static PIDcontrol bPID(BED_HEATER_PIN, BED_TEMPERATURE_PIN, true);


bed::bed(byte heat, byte temp, int t_cutoff)
{
  heater_pin = heat;
  temp_pin = temp;
  thermalCutoff = t_cutoff;

  manageCount = 0;
  bedPID = &bPID;

  //setup our pins

  pinMode(heater_pin, OUTPUT);
  pinMode(temp_pin, INPUT);
  
  analogWrite(heater_pin, 0);
  
  digitalWrite(temp_pin, false);

  //these our the default values for the extruder.

  targetTemperature = 0;

  setTemperature(targetTemperature);
}

void bed::controlTemperature()
{   
  bedPID->pidCalculation(targetTemperature);
}



void bed::slowManage()
{
  manageCount = 0;  

  controlTemperature();
}

void bed::manage()
{
  manageCount++;
  if(manageCount > SLOW_CLOCK)
    slowManage();   
}

// Stop everything

void bed::shutdown()
{
  setTemperature(0);
  bedPID->shutdown();
}

void bed::setTemperature(int tp)
{
  bedPID->reset();
  targetTemperature = tp;
}

int bed::getTemperature()
{
  return bedPID->temperature();  
}


void bed::waitForTemperature()
{
  byte seconds = 0;
  bool warming = true;
  count = 0;
  newT = 0;
  oldT = newT;

  while (true)
  {
    newT += getTemperature();
    count++;
    if(count > 5)
    {
      newT = newT/5;
      if(newT >= targetTemperature - HALF_DEAD_ZONE)
      {
        warming = false;
        if(seconds > WAIT_AT_TEMPERATURE)
          return;
        else 
          seconds++;
      } 

      if(warming)
      {
        if(newT > oldT)
        {
          oldT = newT;
          if (newT > thermalCutoff)
          {
            temperatureError("Temperature above thermal cutoff (bed overheated) - hard fault.");
          }
        }
        else
        {
          // Temp isn't increasing - extruder hardware error
          temperatureError("Bed temperature not rising - hard fault. Check that heater and sensor are both connected.");
          return;
        }
      }

      newT = 0;
      count = 0;
    }
    for(int i = 0; i < 1000; i++)
    {
      manage();
      delay(1);
    }
  }
}

// This is a fatal error - something is wrong with the heater.

void bed::temperatureError(char error[])
{
  sprintf(talkToHost.string(), error);
  talkToHost.setFatal();
}

#endif
