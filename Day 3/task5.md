## Task 5: Write a script to summarize data from a log file. 

```bash
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
```

Let's break down the provided Bash script step by step. This script summarizes data from a log file (`application.log`), counting log entries by type, extracting and summarizing error messages, and calculating log entries per hour.

### 1. Setting the Log File
```bash
# Log file to summarize
logfile="application.log"
```
- **logfile="application.log"**: This line sets a variable `logfile` to the name of the log file we want to analyze, `application.log`. This allows the file name to be reused throughout the script without having to type it multiple times.

### 2. Counting Log Levels
```bash
echo "Log Summary:"
echo "INFO count:"
grep -c "INFO" "$logfile"
echo "WARNING count:"
grep -c "WARNING" "$logfile"
echo "ERROR count:"
grep -c "ERROR" "$logfile"
```
- **echo "Log Summary:"**: This prints "Log Summary:" to the terminal to indicate that a summary of the log file is about to be displayed.

- **grep -c "INFO" "$logfile"**:
  - **`grep`**: A command that searches for a specific pattern in a file.
  - **`-c`**: This option tells `grep` to count the number of lines that match the pattern instead of printing the matching lines.
  - **`"INFO"`**: The pattern we're searching for, in this case, lines containing "INFO".
  - **`"$logfile"`**: The file in which `grep` should search, which is `application.log` in this case.
  - This line counts how many times "INFO" appears in the log file, representing the number of informational messages.

- **grep -c "WARNING" "$logfile"**: Similar to the above command but counts the lines containing "WARNING".

- **grep -c "ERROR" "$logfile"**: Similar to the above commands but counts the lines containing "ERROR".

### 3. Extracting and Counting the Top 3 Most Frequent ERROR Messages
```bash
echo -e "\nTop 3 ERROR messages:"
grep "ERROR" "$logfile" | awk '{$1=""; $2=""; $3=""; print $0}' | sort | uniq -c | sort -nr | head -3
```
- **echo -e "\nTop 3 ERROR messages:"**: 
  - **`-e`**: Enables interpretation of backslash escapes.
  - **`\n`**: Adds a newline for better readability.
  - This line prints "Top 3 ERROR messages:" to the terminal.

- **grep "ERROR" "$logfile"**:
  - Extracts all lines from the log file that contain "ERROR". The output of this command is a list of error messages.

- **awk '{$1=""; $2=""; $3=""; print $0}'**:
  - **`awk`**: A text-processing tool that allows for pattern scanning and processing.
  - **`$1`, `$2`, `$3`**: Represents the first, second, and third fields in each line (by default, fields are separated by whitespace).
  - **`$1="", $2="", $3=""`**: This effectively deletes the first three fields in each line, which are typically the timestamp and the "ERROR" keyword.
  - **`print $0`**: Prints the remainder of the line after removing the first three fields, which is the actual error message.

- **sort**:
  - Sorts the error messages alphabetically. Since `awk` removed the timestamp and log level, the sorting is done purely based on the content of the error message.

- **uniq -c**:
  - **`uniq`**: Filters out repeated lines in a sorted file.
  - **`-c`**: Precedes each line with the number of times it occurred.
  - This command counts the number of occurrences of each unique error message.

- **sort -nr**:
  - **`-n`**: Sorts numerically.
  - **`-r`**: Reverses the sort order, so the most frequent error messages appear first.

- **head -3**:
  - Displays only the top 3 most frequent error messages.

### 4. Counting Log Entries Per Hour
```bash
echo -e "\nLog entries per hour:"
awk '{print $2}' "$logfile" | awk -F: '{print $1}' | sort | uniq -c | sort -nr
```
- **echo -e "\nLog entries per hour:"**: 
  - Prints "Log entries per hour:" with a preceding newline for readability.

- **awk '{print $2}' "$logfile"**:
  - Extracts the second field from each line, which is the timestamp (e.g., `10:14:23`).
  - This command isolates the time from the log entry.

- **awk -F: '{print $1}'**:
  - **`-F:`**: Sets the field separator to `:` (colon).
  - **`print $1`**: Prints the first field, which corresponds to the hour portion of the timestamp (e.g., `10` from `10:14:23`).

- **sort | uniq -c | sort -nr**:
  - **sort**: Sorts the list of hours.
  - **uniq -c**: Counts the occurrences of each hour.
  - **sort -nr**: Sorts the hours in descending order based on the number of occurrences.

### Summary
This script effectively summarizes the log file by counting the occurrences of different log levels, identifying the top error messages, and analyzing log entries on an hourly basis. The use of `grep`, `awk`, `sort`, `uniq`, and `head` allows for powerful text processing and analysis directly from the command line.