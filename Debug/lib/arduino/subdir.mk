################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../lib/arduino/HardwareSerial.cpp \
../lib/arduino/Print.cpp \
../lib/arduino/Tone.cpp \
../lib/arduino/WMath.cpp \
../lib/arduino/WString.cpp 

C_SRCS += \
../lib/arduino/WInterrupts.c \
../lib/arduino/pins_arduino.c \
../lib/arduino/wiring.c \
../lib/arduino/wiring_analog.c \
../lib/arduino/wiring_digital.c \
../lib/arduino/wiring_pulse.c \
../lib/arduino/wiring_shift.c 

OBJS += \
./lib/arduino/HardwareSerial.o \
./lib/arduino/Print.o \
./lib/arduino/Tone.o \
./lib/arduino/WInterrupts.o \
./lib/arduino/WMath.o \
./lib/arduino/WString.o \
./lib/arduino/pins_arduino.o \
./lib/arduino/wiring.o \
./lib/arduino/wiring_analog.o \
./lib/arduino/wiring_digital.o \
./lib/arduino/wiring_pulse.o \
./lib/arduino/wiring_shift.o 

C_DEPS += \
./lib/arduino/WInterrupts.d \
./lib/arduino/pins_arduino.d \
./lib/arduino/wiring.d \
./lib/arduino/wiring_analog.d \
./lib/arduino/wiring_digital.d \
./lib/arduino/wiring_pulse.d \
./lib/arduino/wiring_shift.d 

CPP_DEPS += \
./lib/arduino/HardwareSerial.d \
./lib/arduino/Print.d \
./lib/arduino/Tone.d \
./lib/arduino/WMath.d \
./lib/arduino/WString.d 


# Each subdirectory must supply rules for building sources it contributes
lib/arduino/%.o: ../lib/arduino/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -I"/home/fumon/ddt/proj/RepRapWorkspace/firmware-hacker-workspace/RepRapUltimakerFirmware/lib/arduino" -I"/home/fumon/ddt/proj/RepRapWorkspace/firmware-hacker-workspace/RepRapUltimakerFirmware/lib/WiringSerial" -I"/home/fumon/ddt/proj/RepRapWorkspace/firmware-hacker-workspace/toolhead-lib/src" -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -fno-exceptions -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

lib/arduino/%.o: ../lib/arduino/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


