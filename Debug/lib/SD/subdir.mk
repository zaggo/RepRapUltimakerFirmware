################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/File.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/SD.cpp 

OBJS += \
./lib/SD/File.o \
./lib/SD/SD.o 

CPP_DEPS += \
./lib/SD/File.d \
./lib/SD/SD.d 


# Each subdirectory must supply rules for building sources it contributes
lib/SD/File.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/File.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/SD/SD.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/SD.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


