#!/bin/bash

#prwrd.sh

for i in `tree -fi --noreport data | grep -v '^data$'`; do
	cat $i
done
