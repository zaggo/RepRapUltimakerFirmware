################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/hardware/arduino_toolhead.c 

OBJS += \
./lib/Toolhead/src/hardware/arduino_toolhead.o 

C_DEPS += \
./lib/Toolhead/src/hardware/arduino_toolhead.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Toolhead/src/hardware/arduino_toolhead.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Toolhead/src/hardware/arduino_toolhead.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


