################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/cartesian_dda.cpp \
../src/fancy.cpp \
../src/firmware.cpp \
../src/main.cpp \
../src/process_g_code.cpp \
../src/toolhead_stepper.cpp \
../src/vectors.cpp 

OBJS += \
./src/cartesian_dda.o \
./src/fancy.o \
./src/firmware.o \
./src/main.o \
./src/process_g_code.o \
./src/toolhead_stepper.o \
./src/vectors.o 

CPP_DEPS += \
./src/cartesian_dda.d \
./src/fancy.d \
./src/firmware.d \
./src/main.d \
./src/process_g_code.d \
./src/toolhead_stepper.d \
./src/vectors.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: AVR C++ Compiler'
	avr-g++ -Wall -g2 -gstabs -O0 -fpack-struct -fshort-enums -funsigned-char -funsigned-bitfields -fno-exceptions -mmcu=atmega1280 -DF_CPU=16000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


