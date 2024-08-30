#!/bin/sh
file="data.txt"
awk -F, '{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}' "$file"
awk -F, '{sum +=$2 ; count++} END {print "The average age is :" sum/count}' "$file"