#Just the beginning.

CC = gcc
CFLAGS = -Wall -W -Wextra -fexpensive-optimizations\
-funroll-loops -fno-builtin -s -std=c89 -Os -O3

all: nojs pol pot

nojs: nojs.c
	${CC} ${CFLAGS} nojs.c -o nojs

#placeholders
pol:
	true
pot:
	true

clean: logclean dataclean binclean

logclean: mkdict.log
	echo -n ''>mkdict.log

dataclean: data
	rm data/*

binclean:
	rm -f nojs pol pot
