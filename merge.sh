#!/bin/bash
IFS='
'

for i in `cat`; do
	a=`grep "$i" links`
	if [ -z "$a" ]; then
		echo $i >>$1
	fi
done
