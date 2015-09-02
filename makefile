#Makefile for the mkdict script

clean: logclean dataclean

logclean: mkdict.log
	echo -n ''>mkdict.log

dataclean: data
	rm data/*

