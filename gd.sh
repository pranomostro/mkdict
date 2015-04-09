#!/bin/bash
curl $1|
tr '\n' ' '|
sed -e 's/<[^>]\+>/ /g'|
sed -e 's/  */ /g'|
sed -e 's/\t\t*/ /g'|
tr '[ ]' '\n'|
sed -e '/ /d'|
sed -e '/^$/d'|
grep '^[a-zA-Z][a-zA-Z]*$'
