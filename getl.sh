#!/bin/bash

#getl.sh

curl "$1" | tee data/"$2" | tr '\n' ' ' | grep -o '<a href="[^"]*"' | sed 's/^<a href="//;s/"$//' | grep -E "$3" | sed 's/.*/https:\/\/de.wikipedia.org&/'
