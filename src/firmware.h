/*
 * RepRapUltimakerFirmware.h
 *
 *  Created on: 2011-04-05
 *      Author: rob
 */

#ifndef REPRAPULTIMAKERFIRMWARE_H_
#define REPRAPULTIMAKERFIRMWARE_H_

extern "C" {
  #include <toolhead.h>
  #include <hardware/arduino_toolhead.h>
}

#include "vectors.h"
#include "configuration.h"
#include "pins.h"

#include "toolhead_stepper.h"
//TODO:readd#include "hostcom.h"
//#include "intercom.h" TODO: remove?
#include "cartesian_dda.h"
#include "fancy.h"
//TODO:readd#include "process_g_code.h"

//TODO:readdstatic hostcom talkToHost;

#include <WProgram.h>

void loop();
void setup();
void shutdown();


void setTimer(long delay);

// Inline interrupt control functions

extern void set_toolhead_stepper_enable(struct toolhead * t, int enable);

inline void enableTimerInterrupt();

inline void disableTimerInterrupt();
inline void cancelAndClearQueue();


inline void setTimerCeiling(unsigned int c);

inline void resetTimer();

void setupTimerInterrupt();

void setTimerResolution(byte r);


// equal to null if we are not waiting for a heater to reach temperature or the heater we are waiting for
extern struct heater * waitForTemperature;
extern int waitForAllTemperatures;

extern heater *heatedBed;

#if EXTRUDER_COUNT == 2
extern struct toolhead ex1;
#endif

extern struct toolhead ex0;

#endif /* REPRAPULTIMAKERFIRMWARE_H_ */
