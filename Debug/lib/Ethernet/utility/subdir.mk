################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/utility/socket.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/utility/w5100.cpp 

OBJS += \
./lib/Ethernet/utility/socket.o \
./lib/Ethernet/utility/w5100.o 

CPP_DEPS += \
./lib/Ethernet/utility/socket.d \
./lib/Ethernet/utility/w5100.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Ethernet/utility/socket.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/utility/socket.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Ethernet/utility/w5100.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/utility/w5100.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


