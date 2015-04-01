#!/bin/bash
curl $1 |
tr -d '\n'|
sed -e 's/<[^>]\+>/ /g'|
 tr '[\t ]' '\n'|
 strings|
 sed '/[^A-Za-z0-9]/d'|
 sort|
 uniq -c|
 sort -n > worte.txt
