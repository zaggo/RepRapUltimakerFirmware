################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../excluded/hostcom.cpp \
../excluded/intercom.cpp \
../excluded/process_g_code.cpp 

OBJS += \
./excluded/hostcom.o \
./excluded/intercom.o \
./excluded/process_g_code.o 

CPP_DEPS += \
./excluded/hostcom.d \
./excluded/intercom.d \
./excluded/process_g_code.d 


# Each subdirectory must supply rules for building sources it contributes
excluded/%.o: ../excluded/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/home/rob/workspaces/ultimaker-hacker-workspace/RepRapUltimakerFirmware/lib/arduino" -I"/home/rob/workspaces/ultimaker-hacker-workspace/toolhead-lib/lib/wiring" -I"/home/rob/workspaces/ultimaker-hacker-workspace/toolhead-lib/src" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -fno-exceptions -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


