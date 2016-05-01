#SRCS = tft.c glcdfont.c stm32f0xx_gpio.c stm32f0xx_rcc.c
SRCS = tft.c glcdfont.c


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

CFLAGS += -I../libs -I../libs/inc -I../libs/inc/core -I../libs/inc/peripherals

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: libtft.a

all: libtft.a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^ -L../libs -lstm32f0 -ltiming

libtft.a: $(OBJS)
	$(AR) -r $@ $(OBJS)

clean:
	rm -f $(OBJS) libtft.a
