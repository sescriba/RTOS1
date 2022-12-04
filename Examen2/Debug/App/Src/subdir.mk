################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../App/Src/app.c \
../App/Src/task_A.c \
../App/Src/task_AB.c \
../App/Src/task_B.c \
../App/Src/task_C.c \
../App/Src/task_Test.c 

OBJS += \
./App/Src/app.o \
./App/Src/task_A.o \
./App/Src/task_AB.o \
./App/Src/task_B.o \
./App/Src/task_C.o \
./App/Src/task_Test.o 

C_DEPS += \
./App/Src/app.d \
./App/Src/task_A.d \
./App/Src/task_AB.d \
./App/Src/task_B.d \
./App/Src/task_C.d \
./App/Src/task_Test.d 


# Each subdirectory must supply rules for building sources it contributes
App/Src/%.o App/Src/%.su: ../App/Src/%.c App/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I"D:/Documents/CESE/RTOS1/RTOS1/Examen2/Supporting_Functions/Inc" -I"D:/Documents/CESE/RTOS1/RTOS1/Examen2/App/Inc" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"D:/Documents/CESE/RTOS1/RTOS1/Examen2/App/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-App-2f-Src

clean-App-2f-Src:
	-$(RM) ./App/Src/app.d ./App/Src/app.o ./App/Src/app.su ./App/Src/task_A.d ./App/Src/task_A.o ./App/Src/task_A.su ./App/Src/task_AB.d ./App/Src/task_AB.o ./App/Src/task_AB.su ./App/Src/task_B.d ./App/Src/task_B.o ./App/Src/task_B.su ./App/Src/task_C.d ./App/Src/task_C.o ./App/Src/task_C.su ./App/Src/task_Test.d ./App/Src/task_Test.o ./App/Src/task_Test.su

.PHONY: clean-App-2f-Src

