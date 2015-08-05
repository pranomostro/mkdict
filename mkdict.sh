#!/bin/bash

function getl()
{
#Replace the pattern in the last grep and sed for configuration
	grep -o '<a href="[^"]*"' |
	sed 's/^<a href="//;s/"$//' |
	grep -E '^(\/)\/+wiki[^:]+$' |
	sed 's/^/https:\/\/de.wikipedia.org/'
}

function gd()
{
	sed -ue 's/<[^>]\+>/ /g'|
	tr -s '\t ' '\n'|
	grep '^[a-zA-ZüöäÜÖÄßẞ][a-züöäß]\+$'|
	grep -vE '([a-zA-ZüöäÜÖÄßẞ])\1{3}'|
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
		curl "$1" | tee data/"$2" | getl "$i" "$a" | merge links
	else
		curl $i > data/"$a"
	fi
done

cat data/* | gd | awk '{ n[$0]++ } END { for (i in n) { print n[i] " " i } }'
| sort -n >dict.txt

n=`wc -l dict.txt | awk '{ print $1 }'`
awk "{ print (\$1/$n)*1000000 \" \" \$2}" dict.txt > dict

mv dict dict.txt
