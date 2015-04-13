#!/bin/bash

#getl.sh

curl $1 | tr '\n' ' ' | grep -o '<a href="[^"]*"' | sed 's/^<a href="//;s/"$//' | grep '^http:\/\/' | grep 'www.faz.net'
