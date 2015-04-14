#!/bin/bash

#prwrd.sh

for i in `du -a data`; do
	./gd.sh $i
done
