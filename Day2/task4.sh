#!/bin/sh

ls /nonexistent_directory
if [ $? -ne 0 ]
then
  echo "Command failed"
  exit 1
else
  echo "Command Successful"
fi