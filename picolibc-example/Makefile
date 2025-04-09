TARGET = picolibc-example

SRC = main.c
SRC += startup.s

include ../build.mk

FLAGS = -Os -specs=picolibc.specs -march=rv32imac -mabi=ilp32 -T../ld/Link-pico.ld
