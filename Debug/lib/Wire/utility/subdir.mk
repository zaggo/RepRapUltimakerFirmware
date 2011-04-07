################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Wire/utility/twi.c 

OBJS += \
./lib/Wire/utility/twi.o 

C_DEPS += \
./lib/Wire/utility/twi.d 


# Each subdirectory must supply rules for building sources it contributes
lib/Wire/utility/twi.o: /home/rob/Documents/replicators/arduino-ultimaker-git/libraries/Wire/utility/twi.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


