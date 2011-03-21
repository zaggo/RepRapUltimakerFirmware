#ifndef TEMPERATURE_H
#define TEMPERATURE_H

// The temperature control dead zone in deg C

#define HALF_DEAD_ZONE 5

typedef struct
{
  short **table;
  int length;
} ThermisterTemperatureTable;

extern ThermisterTemperatureTable *bed_temp_table;
extern ThermisterTemperatureTable *temp_table;

void init_thermistor_tables();

#endif
