#!/bin/bash

#mkdict.sh

touch links dict.txt

echo $1 >links
IFS='
'
for a in `seq 1 10000`; do
	i=`sed -n "$a p" links`
	./getl.sh $i | ./merge.sh links
done

./prwrd | awk '{ n[$0]++ } END { for ( i in n ) { print n[i] " " i } }' | sort -n >dict.txt

n=`awk '{ a+=$1 } END { print a }' dict.txt `
awk "{ print (\$1/$n)*1000000 \" \" \$2}" dict.txt > dict

mv dict dict.txt

rm link