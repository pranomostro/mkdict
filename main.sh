#!/bin/bash

prwrd()
{
	for i in `cat links`; do
		./gd.sh $i
	done
}

touch links dict.txt

echo $1 >links
IFS='
'
for a in `seq 1 1`; do
	i=`sed -n "$a p" links`
	./getl.sh $i | ./merge.sh links
done

prwrd | awk '{ n[$0]++ } END { for ( i in n ) { print n[i] '' '' i } }' >dict.txt

rm links
