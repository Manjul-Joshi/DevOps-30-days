#!/bin/sh

for i in {1..5}
do touch file_$i
echo "File file_$i is created."
done

ls

for i in {1..5}
do rm file_$i
echo "File file_$i is deleted."
done

ls 