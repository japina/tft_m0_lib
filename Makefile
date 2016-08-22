SRCS = tft.c
SRCS += assert.c
SRCS += stm32f0xx_gpio.c
SRCS += stm32f0xx_rcc.c

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

CFLAGS += -Iinc -I../libs -I../libs/inc
CFLAGS += -I../libs/inc/core -I../libs/inc/peripherals

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: libtft.a

all: libtft.a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^ #-L../libs -ltiming

libtft.a: $(OBJS)
	$(AR) -r $@ $(OBJS)

clean:
	rm -f $(OBJS) libtft.a
