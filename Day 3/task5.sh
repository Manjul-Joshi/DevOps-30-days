#!/bin/bash

# Log file to summarize
logfile="application.log"

echo "Log Summary:"
echo "INFO count:"
grep -c "INFO" "$logfile"
echo "WARNING count:"
grep -c "WARNING" "$logfile"
echo "ERROR count:"
grep -c "ERROR" "$logfile"

echo -e "\nTop 3 ERROR messages:"
grep "ERROR" "$logfile" | awk '{$1=""; $2=""; $3=""; print $0}' | sort | uniq -c | sort -nr | head -3

echo -e "\nLog entries per hour:"
awk '{print $2}' "$logfile" | awk -F: '{print $1}' | sort | uniq -c | sort -nr