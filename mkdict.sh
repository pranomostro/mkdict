#!/bin/bash

function getl()
{
#Replace the pattern in the last grep and sed for configuration
	grep -o '<a href="[^"]*"' |
	sed 's/^<a href="//;s/"$//' |
	grep -E '^(\/)+wiki\/[^:]+$' |
	sed 's/^/https:\/\/en.wikipedia.org/'
}

function gd()
{
#Edit badwords.txt for words you don't want in you dictionary.
	./skip '<script' '</script>'|
	./skip '<' '>'|
	tr -s '\t ' '\n'|
	grep '^[a-zA-Z][a-z]\+$'|
	grep -vE '([a-zA-Z])\1{3}'|
	grep -vFf badwords.txt
}

function merge()
{
	for i in `cat`; do
		a=`grep "$i" links`
		if [ -z "$a" ]; then
			echo $i >>$1
		fi
	done
}

if [ $# -ne 2 ]; then
	echo "mkdict LINK COUNT" >/dev/stderr
	exit 1
fi

touch links dict.txt

echo $1 >links

IFS='
'

for a in `seq 1 "$2"`; do
	i=`sed -n "$a p" links`
	if [ `wc -l links | awk '{ print $1 }'` -le "$2" ]; then
		curl "$i" | tee data/"$a" | getl | merge links
	else
		curl $i > data/"$a"
	fi
done

cat data/* | gd | awk '{ n[$0]++ } END { for (i in n) { print n[i] " " i } }' |
sort -n >dict.txt

n=`awk '{ a+=$1 } END { print a }' dict.txt`
awk "{ print (\$1/$n)*1000000 \" \" \$2}" dict.txt > dict

mv dict dict.txt

exit 0
