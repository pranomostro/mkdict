#!/bin/bash

touch links dict.txt

echo $1 >links

IFS='
'

for a in `seq 1 $2`; do
	i=`sed -n "$a p" links`
	if [ `wc -l links | awk '{ print $1 }'` -le "$2" ]; then
		getl $i $a $3 | merge links
	else
		curl $i > data/"$a"
	fi
done

prwd.sh | gd | awk '{ n[$0]++ } END { for ( i in n ) { print n[i] " " i } }' | sort -n >dict.txt

n=`awk '{ a+=$1 } END { print a }' dict.txt `
awk "{ print (\$1/$n)*1000000 \" \" \$2}" dict.txt > dict

mv dict dict.txt

rm links

function getl()
{
	curl "$1" | tee data/"$2" | tr '\n' ' ' | grep -o '<a href="[^"]*"' |
	sed 's/^<a href="//;s/"$//' | grep -E "$3" | sed 's/.*/https:\/\/de.wikipedia.org&/'
}

function gd()
{
	sed -ue 's/<[^>]\+>/ /g'|
	tr -s '\t ' '\n'|
	9 grep '^[a-zA-ZüöäÜÖÄßẞ][a-züöäß]+$'|
	ag -v '([a-zA-ZüöäÜÖÄßẞ])\1{3}'|
	grep -vE '^(break|case|catch|continue|debugger|
	default|delete|do|else|false|finally|for|function|
	if|in|instanceof|new|null|return|switch|this|
	throw|true|try|typeof|var|void|while|with|abstract|
	boolean|byte|char|class|const|double|enum|export|
	extends|final|float|goto|implements|import|int|
	interface|let|long|native|package|private|protected|
	public|short|static|super|synchronized|throws|transient|
	volatile|yield|alert|blur|closed|document|focus|
	frames|history|innerHeight|innerWidth|length|location|
	navigator|open|outerHeight|outerWidth|parent|screen|
	screenX|screenY|statusbar|window|sync|cache|ibn|of|
	at|en|fr|Fr|Sa|Mo|di|Mi|mi|Le|la|del|to|tsor|de|the|cache)$'
#Javascript keywords which are clearly not german words
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

function prwd()
{
	for i in `tree -fi --norpeort data | grep -v '^data'`; do
		cat $i
	done
}
