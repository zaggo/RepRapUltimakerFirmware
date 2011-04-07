################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/heater.c \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/temperature_sensor.c \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/toolhead.c \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/toolhead_error.c 

OBJS += \
./lib/Toolhead/src/heater.o \
./lib/Toolhead/src/temperature_sensor.o \
./lib/Toolhead/src/toolhead.o \
./lib/Toolhead/src/toolhead_error.o 

C_DEPS += \
./lib/Toolhead/src/heater.d \
./lib/Toolhead/src/temperature_sensor.d \
./lib/Toolhead/src/toolhead.d \
./lib/Toolhead/src/toolhead_error.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Toolhead/src/heater.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/heater.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Toolhead/src/temperature_sensor.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/temperature_sensor.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Toolhead/src/toolhead.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/toolhead.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Toolhead/src/toolhead_error.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/toolhead_error.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


