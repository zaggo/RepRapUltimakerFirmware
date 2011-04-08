################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../excluded/hostcom.cpp \
../excluded/intercom.cpp 

OBJS += \
./excluded/hostcom.o \
./excluded/intercom.o 

CPP_DEPS += \
./excluded/hostcom.d \
./excluded/intercom.d 


# Each subdirectory must supply rules for building sources it contributes
excluded/%.o: ../excluded/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -fno-exceptions -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


