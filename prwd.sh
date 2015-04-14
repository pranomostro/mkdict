#!/bin/bash

#prwrd.sh

for i in `tree -fi --noreport data | grep -v '^data$'`; do
	./gd.sh $i
done
