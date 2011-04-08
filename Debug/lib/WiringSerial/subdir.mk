################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../lib/WiringSerial/wiring_serial.o 

C_SRCS += \
../lib/WiringSerial/wiring_serial.c 

OBJS += \
./lib/WiringSerial/wiring_serial.o 

C_DEPS += \
./lib/WiringSerial/wiring_serial.d 


# Each subdirectory must supply rules for building sources it contributes
lib/WiringSerial/%.o: ../lib/WiringSerial/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/rob/workspaces/ultimaker-hacker-workspace/RepRapUltimakerFirmware/lib/arduino" -I"/home/rob/workspaces/ultimaker-hacker-workspace/RepRapUltimakerFirmware/lib/WiringSerial" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


