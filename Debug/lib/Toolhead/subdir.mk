################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/Toolhead/heater.c \
../lib/Toolhead/solenoid.c \
../lib/Toolhead/temperature_sensor.c \
../lib/Toolhead/toolhead.c \
../lib/Toolhead/toolhead_error.c 

OBJS += \
./lib/Toolhead/heater.o \
./lib/Toolhead/solenoid.o \
./lib/Toolhead/temperature_sensor.o \
./lib/Toolhead/toolhead.o \
./lib/Toolhead/toolhead_error.o 

C_DEPS += \
./lib/Toolhead/heater.d \
./lib/Toolhead/solenoid.d \
./lib/Toolhead/temperature_sensor.d \
./lib/Toolhead/toolhead.d \
./lib/Toolhead/toolhead_error.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Toolhead/%.o: ../lib/Toolhead/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/rob/sketchbook/RepRapUltimakerFirmware/lib/Toolhead" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


