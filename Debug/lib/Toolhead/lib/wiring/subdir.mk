################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/pins_arduino.c \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/wiring_analog.c \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/wiring_digital.c 

OBJS += \
./lib/Toolhead/lib/wiring/pins_arduino.o \
./lib/Toolhead/lib/wiring/wiring_analog.o \
./lib/Toolhead/lib/wiring/wiring_digital.o 

C_DEPS += \
./lib/Toolhead/lib/wiring/pins_arduino.d \
./lib/Toolhead/lib/wiring/wiring_analog.d \
./lib/Toolhead/lib/wiring/wiring_digital.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Toolhead/lib/wiring/pins_arduino.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/pins_arduino.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Toolhead/lib/wiring/wiring_analog.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/wiring_analog.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Toolhead/lib/wiring/wiring_digital.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/lib/wiring/wiring_digital.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


