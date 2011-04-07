################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Client.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Ethernet.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Server.cpp \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Udp.cpp 

OBJS += \
./lib/Ethernet/Client.o \
./lib/Ethernet/Ethernet.o \
./lib/Ethernet/Server.o \
./lib/Ethernet/Udp.o 

CPP_DEPS += \
./lib/Ethernet/Client.d \
./lib/Ethernet/Ethernet.d \
./lib/Ethernet/Server.d \
./lib/Ethernet/Udp.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Ethernet/Client.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Client.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Ethernet/Ethernet.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Ethernet.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Ethernet/Server.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Server.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/Ethernet/Udp.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Ethernet/Udp.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


