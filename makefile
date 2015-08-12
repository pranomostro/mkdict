#Makefile for the mkdict script and related utilities.

CC = gcc
CFLAGS = -Wall -W -Wextra -fexpensive-optimizations\
-funroll-loops -fno-builtin -s -std=c89 -Os -O3

all: skip

skip: skip.c
	${CC} ${CFLAGS} skip.c -o skip

clean: logclean dataclean binclean

logclean: mkdict.log
	echo -n ''>mkdict.log

dataclean: data
	rm data/*

binclean:
	rm -f skip
