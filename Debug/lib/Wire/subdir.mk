################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Wire/Wire.cpp 

OBJS += \
./lib/Wire/Wire.o 

CPP_DEPS += \
./lib/Wire/Wire.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Wire/Wire.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Wire/Wire.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


