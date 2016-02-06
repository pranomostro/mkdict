#!/bin/bash

function getl()
{
#Replace the pattern in the last grep and sed for configuration
	grep -o '<a href="[^"]*"' |
	sed 's/^<a href="//;s/"$//' |
	grep -E '^(\/)+wiki\/[^:]+$' |
	sed 's/^/https:\/\/de.wikipedia.org/'
}

function merge()
{
	for i in `cat`; do
		a=`grep "$i" links`
		if [ -z "$a" ]; then
			echo "$i" >>"$1"
		fi
	done
}

if [ $# -ne 2 ]; then
	echo "dl LINK COUNT" 1>&2
	exit 1
fi

echo "$1" >links

IFS='
'

for a in `seq 1 "$2"`; do
	i=`sed -n "$a p" links`
	if [ `wc -l links | awk '{ print $1 }'` -le "$2" ]; then
		curl -s "$i" | tee data/"$a" | getl | merge links
	else
		curl -s "$i" > data/"$a"
	fi
done
