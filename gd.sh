#!/bin/bash
curl $1 |
tr -d '\n'|
sed -e 's/<[^>]\+>/ /g'|
sed -e 's/  */ /g'|
sed -e 's/\t\t*/ /g'|
tr '[\t ]' '\n'|
sed -e '/ /d'|
sed -e '/^$/d'|
sed -e '/[^A-Za-z0-9]/d'|
sort|
uniq -c|
sort -n
