/*
 * This controld the heated bed (if any).
 */

#ifndef BED_H
#define BED_H
#define SLOW_CLOCK 2000

#if MOTHERBOARD != 2  

class bed
{
  
public:
   bed(byte heat, byte temp, int t_cutoff);
   void waitForTemperature();
   
   void setTemperature(int temp);
   int getTemperature();
   void slowManage();
   void manage();
   void shutdown();
 
private:

   int targetTemperature;
   int count;
   int oldT, newT;
   int thermalCutoff;
   long manageCount;
   
   PIDcontrol* bedPID;    // Temperature control - extruder...

   int sampleTemperature();
   void controlTemperature();
   void temperatureError(char error[]); 

// The pins we control
   byte heater_pin,  temp_pin;
 
};

#endif
#endif
