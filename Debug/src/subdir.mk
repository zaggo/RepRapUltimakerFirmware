################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/rob/sketchbook/RepRapUltimakerFirmware/cartesian_dda.cpp \
/home/rob/sketchbook/RepRapUltimakerFirmware/fancy.cpp \
/home/rob/sketchbook/RepRapUltimakerFirmware/intercom.cpp \
/home/rob/sketchbook/RepRapUltimakerFirmware/process_g_code.cpp \
/home/rob/sketchbook/RepRapUltimakerFirmware/toolhead_stepper.cpp 

OBJS += \
./src/cartesian_dda.o \
./src/fancy.o \
./src/intercom.o \
./src/process_g_code.o \
./src/toolhead_stepper.o 

CPP_DEPS += \
./src/cartesian_dda.d \
./src/fancy.d \
./src/intercom.d \
./src/process_g_code.d \
./src/toolhead_stepper.d 


# Each subdirectory must supply rules for building sources it contributes
src/cartesian_dda.o: /home/rob/sketchbook/RepRapUltimakerFirmware/cartesian_dda.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/libraries/" -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/fancy.o: /home/rob/sketchbook/RepRapUltimakerFirmware/fancy.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/libraries/" -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/intercom.o: /home/rob/sketchbook/RepRapUltimakerFirmware/intercom.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/libraries/" -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/process_g_code.o: /home/rob/sketchbook/RepRapUltimakerFirmware/process_g_code.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/libraries/" -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/toolhead_stepper.o: /home/rob/sketchbook/RepRapUltimakerFirmware/toolhead_stepper.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I"/libraries/" -O0 -g3 -Wall -c -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


