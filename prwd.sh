#!/bin/bash

#prwrd.sh

for i in `cat links`; do
	./gd.sh $i
done
