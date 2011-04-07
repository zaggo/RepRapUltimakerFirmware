################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/Sd2Card.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/SdFile.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/SdVolume.cpp 

OBJS += \
./lib/SD/utility/Sd2Card.o \
./lib/SD/utility/SdFile.o \
./lib/SD/utility/SdVolume.o 

CPP_DEPS += \
./lib/SD/utility/Sd2Card.d \
./lib/SD/utility/SdFile.d \
./lib/SD/utility/SdVolume.d 


# Each subdirectory must supply rules for building sources it contributes
lib/SD/utility/Sd2Card.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/Sd2Card.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/SD/utility/SdFile.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/SdFile.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/SD/utility/SdVolume.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/SD/utility/SdVolume.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


