extern "C" {
  #include <toolhead.h>
  #include <hardware/arduino_toolhead.h>
}

#include "firmware.h"


int pump_toolhead_extruder(void * md, unsigned long time)
{
  //struct toolhead_stepper_data * motor_data = ( (struct toolhead_stepper_data *) md );
  // Managed by the cartesian_dda code.
}

int init_toolhead_stepper(toolhead_stepper_data * motor_data)
{
  pinMode(motor_data->step_pin, OUTPUT);
  pinMode(motor_data->dir_pin, OUTPUT);

  digitalWrite(motor_data->step_pin, 0);
  digitalWrite(motor_data->dir_pin, 0);
  digitalWrite(motor_data->enable_pin, 0);
}

int step_toolhead_stepper(struct toolhead_stepper_data * motor_data)
{
  int stp = ((motor_data->_out == 0)? 1 : 0);
  digitalWrite(motor_data->step_pin, stp);
  motor_data->_out = stp;
  return 0;
}

struct toolhead_stepper_data * toolhead_stepper_data(struct toolhead *t)
{
  return ( (struct toolhead_stepper_data *) t->motor_data );
}


void set_toolhead_stepper_direction(struct toolhead * t, int direction)
{
  struct toolhead_stepper_data * motor_data = ( (struct toolhead_stepper_data *) t->motor_data );
	digitalWrite(motor_data->dir_pin, direction);
}

void set_toolhead_steper_enable(struct toolhead * t, int enable)
{
  struct toolhead_stepper_data * motor_data = ( (struct toolhead_stepper_data *) t->motor_data );
	digitalWrite(motor_data->enable_pin, enable);
}

void set_toolhead_steper_speed(struct toolhead * t, int speed)
{
  struct toolhead_stepper_data * motor_data = ( (struct toolhead_stepper_data *) t->motor_data );
	motor_data->speed = speed;
}

void set_toolhead_steper_steps_per_mm(struct toolhead * t, int steps_per_mm)
{
  struct toolhead_stepper_data * motor_data = ( (struct toolhead_stepper_data *) t->motor_data );
	motor_data->steps_per_mm = steps_per_mm;
}

