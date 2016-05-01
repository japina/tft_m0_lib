SRCS = tft.c glcdfont.c stm32f0xx_gpio.c stm32f0xx_rcc.c


###################################################

CC=arm-none-eabi-gcc
AR=arm-none-eabi-ar

CFLAGS  = -g -O0 -Wall
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m0 -mthumb-interwork
CFLAGS += -mfloat-abi=soft
CFLAGS += -ffreestanding -nostdlib

###################################################

vpath %.c src

ROOT=$(shell pwd)

CFLAGS += -Iinc -Iinc/core -Iinc/peripherals

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: libtft.a

all: libtft.a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

libtft.a: $(OBJS)
	$(AR) -r $@ $(OBJS)

clean:
	rm -f $(OBJS) libtft.a
