#include <temperature_sensor.h>
#include <solenoid.h>
#include <toolhead.h>
#include <heater.h>
#include <toolhead_error.h>

extern "C" {
  #include <toolhead.h>
  #include <hardware/arduino_toolhead.h>
}

#include "firmware.h"
