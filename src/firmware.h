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
#include "hostcom.h"
//#include "intercom.h" TODO: remove?
#include "cartesian_dda.h"
#include "fancy.h"
#include "process_g_code.h"

static hostcom talkToHost;

#include <WProgram.h>

void loop();
void setup();
void shutdown();


void setTimer(long delay);

//  interrupt control functions

extern void set_toolhead_stepper_enable(struct toolhead * t, int enable);

 void enableTimerInterrupt();

 void disableTimerInterrupt();
 void cancelAndClearQueue();


 void setTimerCeiling(unsigned int c);

 void resetTimer();

void setupTimerInterrupt();

void setTimerResolution(byte r);

 void qMove(const FloatPoint& p);
 bool qEmpty();
 void dQMove();
 void setUnits(bool u);
 void setPosition(const FloatPoint& p);


// equal to null if we are not waiting for a heater to reach temperature or the heater we are waiting for
extern struct heater * waitForTemperature;
extern int waitForAllTemperatures;

extern heater *heatedBed;

#if EXTRUDER_COUNT == 2
extern toolhead ex1;
#endif

extern toolhead ex0;

#endif /* REPRAPULTIMAKERFIRMWARE_H_ */
