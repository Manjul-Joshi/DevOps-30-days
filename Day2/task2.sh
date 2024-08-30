#!/bin/sh

read -p "Enter the pattern : " pattern
read -p "Enter the pattern to replace : " replace

 for i in {0..5}; do
 touch $pattern$i.txt
 done

directory="."

for i in $directory/*$pattern*; do 
if [ -f "$i" ]; then 
new_name=$(echo "$i" | sed "s/$pattern/$replace/")
mv "$i" "$new_name"
echo "Change for $i to $new_name"
fi
done