################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Firmata/Firmata.cpp 

OBJS += \
./lib/Firmata/Firmata.o 

CPP_DEPS += \
./lib/Firmata/Firmata.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Firmata/Firmata.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Firmata/Firmata.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


