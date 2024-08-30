## Task 3: Use awk to analyze and format a text file. 

```bash
#!/bin/sh
file="data.txt"
awk -F, '{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}' "$file"
awk -F, '{sum +=$2 ; count++} END {print "The average age is :" sum/count}' "$file"
```

Let's break down the provided Bash commands in detail. These commands use `awk` to process a file named `data.txt`, which presumably contains comma-separated data for names, ages, and occupations.

### Command 1: `awk -F, '{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}' "$file"`

#### Explanation:

1. **`file="data.txt"`**:
   - This sets a variable `file` to hold the name of the file `data.txt`. You can reference this file in the script using `$file`.

2. **`awk`**:
   - `awk` is a powerful text-processing tool that works on a line-by-line basis, typically splitting each line into fields based on a specified delimiter (here, a comma).

3. **`-F,`**:
   - The `-F,` option tells `awk` that the field separator (delimiter) is a comma `,`. This means each line in `data.txt` is split into fields wherever a comma appears.

4. **`'{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}'`**:
   - This is the main `awk` command enclosed in single quotes `'`.
   - **`printf`**: A formatting function in `awk` (similar to `printf` in C) that allows you to control the output format.
   - **`"Name: %s, Age: %d, Occupation: %s\n"`**: The format string, where:
     - **`%s`** is a placeholder for a string (used for the name and occupation).
     - **`%d`** is a placeholder for a decimal integer (used for the age).
     - **`\n`** is a newline character, which ensures each record is printed on a new line.
   - **`$1, $2, $3`**: These are `awk`'s positional variables:
     - **`$1`**: The first field (Name).
     - **`$2`**: The second field (Age).
     - **`$3`**: The third field (Occupation).

5. **`"$file"`**:
   - This is a reference to the variable `file`, which contains the filename `data.txt`. `awk` will process this file.

#### Combined Command:
- This command reads each line in `data.txt`, splits it into fields based on commas, and then prints out the name, age, and occupation in a formatted string.

#### Example:
Given a `data.txt` with the following content:
```text
John Doe,28,Software Engineer
Jane Smith,34,Data Scientist
```
The command would output:
```text
Name: John Doe, Age: 28, Occupation: Software Engineer
Name: Jane Smith, Age: 34, Occupation: Data Scientist
```

### Command 2: `awk -F, '{sum +=$2 ; count++} END {print "The average age is :" sum/count}' "$file"`

#### Explanation:

1. **`awk`**:
   - As before, `awk` is used to process text data.

2. **`-F,`**:
   - Specifies that the field separator (delimiter) is a comma `,`.

3. **`'{sum +=$2 ; count++}'`**:
   - **`sum +=$2`**:
     - This adds the value in the second field (`$2`, which represents the age) to the variable `sum`.
     - `sum` starts at 0 and accumulates the total age as `awk` processes each line.
   - **`count++`**:
     - This increments the variable `count` by 1 for each line processed. `count` is used to keep track of the number of lines (or records) processed.

4. **`END {print "The average age is :" sum/count}'`**:
   - **`END`**: This block of code is executed after `awk` has processed all lines in the file.
   - **`print "The average age is :" sum/count`**:
     - This calculates the average age by dividing the total sum of ages by the count of records and prints the result.

5. **`"$file"`**:
   - Again, this is the file `data.txt` being processed.

#### Combined Command:
- This command processes each line of `data.txt`, adds up all the ages, counts the number of records, and finally computes and prints the average age.

#### Example:
Given the same `data.txt` with:
```text
John Doe,28,Software Engineer
Jane Smith,34,Data Scientist
```
The command would output:
```bash
The average age is : 31
```
Here, `(28 + 34) / 2 = 31`.

### Summary:
- **First Command**: Formats and prints the data from `data.txt` in a human-readable way, displaying the name, age, and occupation.
- **Second Command**: Calculates and prints the average age of the people listed in `data.txt`.