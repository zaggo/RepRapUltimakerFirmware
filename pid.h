#ifndef PID_H
#define PID_H

// Based on the excellent Wikipedia PID control article.
// See http://en.wikipedia.org/wiki/PID_controller

#if MOTHERBOARD != 2

class PIDcontrol
{
  
private:

  bool doingBed;
  unsigned long previousTime; // ms
  unsigned long time;
  float previousError;
  float integral;
  float pGain;
  float iGain;
  float dGain;
  float band;
  float targetTemp;
  byte heat_pin, temp_pin;
  int currentTemperature;

  int analogReadTempPin();
 
#ifdef USE_THERMISTOR
  void internalTemperature(short table[][2]); 
#else
  void internalTemperature(); 
#endif
  void validateTemperature(int t);
  
public:

  PIDcontrol(byte hp, byte tp, bool b);
  void reset();
  void setTarget(int t);
  int getTarget();
  void pidCalculation(int target);
  void shutdown();
  int temperature();
  
};

inline int PIDcontrol::temperature() 
{ 
  return currentTemperature; 
}

#endif
#endif

