################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/ArduinoTestSuite/ArduinoTestSuite.cpp 

OBJS += \
./lib/ArduinoTestSuite/ArduinoTestSuite.o 

CPP_DEPS += \
./lib/ArduinoTestSuite/ArduinoTestSuite.d 


# Each subdirectory must supply rules for building sources it contributes
lib/ArduinoTestSuite/ArduinoTestSuite.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/ArduinoTestSuite/ArduinoTestSuite.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


