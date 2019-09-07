# Path to stlink folder for uploading code to board
#STLINK=~/Embedded/stlink-1.5.1

# Put your source files here (*.c)
SRCS=main.c STM32L4xx_HAL_Driver/system_stm32l4xx.c

# Libraries source files, add ones that you intent to use
#SRCS += stm32f4xx_rcc.c
#SRCS += stm32f4xx_gpio.c
#SRCS += stm32f4xx_usart.c

# Binaries will be generated with this name (.elf, .bin, .hex)
PROJ_NAME=template

# Put your STM32F4 library code directory here, change YOURUSERNAME to yours
STM_COMMON=.

# Compiler settings. Only edit CFLAGS to include other header files.
CC=arm-none-eabi-gcc --specs=nosys.specs
OBJCOPY=arm-none-eabi-objcopy

# Compiler flags
CFLAGS  = -g -O2 -Wall -TSTM32L451RCTX_FLASH.ld
CFLAGS += -DUSE_STDPERIPH_DRIVER
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
CFLAGS += -I.

# Include files from STM libraries
#CFLAGS += -I$(STM_COMMON)/CMSIS/Device/ST/STM32L4xx/Include
CFLAGS += -I$(STM_COMMON)/cmsis_core
#CFLAGS += -I$(STM_COMMON)/CMSIS/Device/ST/STM32L4xx/Include
CFLAGS += -I$(STM_COMMON)/STM32L4xx_HAL_Driver
CFLAGS += -I$(STM_COMMON)/STM32L4xx_HAL_Driver/Inc
#CFLAGS += -I$(STM_COMMON)/Utilities/STM32F4-Discovery

# add startup file to build
SRCS += STM32L4xx_HAL_Driver/startup_stm32l451rctx.s
OBJS = $(SRCS:.c=.o)

vpath %.c $(STM_COMMON)/STM32L4xx_HAL_Driver/Src \

.PHONY: proj

# Commands
all: proj

proj: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@
	$(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin

clean:
	rm -f *.o $(PROJ_NAME).elf $(PROJ_NAME).hex $(PROJ_NAME).bin

# Flash the STM32F4
burn: proj
	$(STLINK)st-flash write $(PROJ_NAME).bin 0x8000000

