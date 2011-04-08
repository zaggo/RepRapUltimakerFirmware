#ifndef TOOLHEAD_STEPPER_H
#define TOOLHEAD_STEPPER_H

toolhead * extruder_in_use = 0;

struct toolhead_stepper_data
{
  int step_pin;
  int dir_pin;
  int enable_pin;

  int steps_per_mm;
  int speed;
  int _out; //private variable to track the current digital output
};

int pump_toolhead_extruder(void * md, unsigned long time);

int init_toolhead_stepper(toolhead_stepper_data * motor_data);

int step_toolhead_stepper(toolhead_stepper_data * motor_data);

toolhead_stepper_data * toolhead_stepper_data(toolhead * t);

void set_toolhead_stepper_direction(toolhead * t, int direction);

void set_toolhead_steper_enable(toolhead * t, int enable);

void set_toolhead_steper_speed(toolhead * t, int speed);

void set_toolhead_steper_steps_per_mm(toolhead * t, int steps_per_mm);

#endif
