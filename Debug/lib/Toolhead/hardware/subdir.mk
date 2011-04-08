################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/Toolhead/hardware/arduino_toolhead.c 

OBJS += \
./lib/Toolhead/hardware/arduino_toolhead.o 

C_DEPS += \
./lib/Toolhead/hardware/arduino_toolhead.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Toolhead/hardware/%.o: ../lib/Toolhead/hardware/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/rob/sketchbook/RepRapUltimakerFirmware/lib/Toolhead" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


