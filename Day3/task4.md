## Task 4: Practice sorting and filtering text data using sort and uniq. 

The `sort` and `uniq` commands in Linux are powerful tools used for text processing. They are often used together to organize and analyze data in text files. Let’s dive into each command, how they work, and provide examples to illustrate their usage.

### 1. `sort` Command

The `sort` command arranges the lines of a text file or input in a particular order. By default, it sorts the lines in alphabetical order, but it can also sort numerically, reverse the order, and much more.

#### Basic Syntax
```bash
sort [options] [file]
```

#### Common Options
- `-n`: Sorts the input numerically.
- `-r`: Reverses the sorting order.
- `-u`: Removes duplicates (this is a shorthand way to combine `sort` and `uniq`).
- `-k`: Sorts based on a specific key (field) in the line.
- `-t`: Specifies a delimiter to define fields.

#### Example 1: Sorting Alphabetically
```bash
cat fruits.txt
apple
banana
cherry
apple
banana
date

sort fruits.txt
```

**Output:**
```text
apple
apple
banana
banana
cherry
date
```

Here, `sort` arranges the lines in alphabetical order.

#### Example 2: Sorting Numerically
```bash
cat numbers.txt
3
10
1
20
2

sort -n numbers.txt
```

**Output:**
```text
1
2
3
10
20
```

The `-n` option tells `sort` to treat the lines as numbers and sort them accordingly.

#### Example 3: Reverse Sorting
```bash
sort -r fruits.txt
```

**Output:**
```text
date
cherry
banana
banana
apple
apple
```

The `-r` option reverses the order of the sorting.

#### Example 4: Sorting by a Specific Field
If you have a file where each line has multiple fields, separated by a space or another delimiter, you can sort by a specific field.

```bash
cat employees.txt
John 25 Developer
Alice 30 Manager
Bob 22 Intern
Eve 35 Director

sort -k 2n employees.txt
```

**Output:**
```text
Bob 22 Intern
John 25 Developer
Alice 30 Manager
Eve 35 Director
```

Here, `-k 2n` sorts by the second field (age), treating it as a number.

### 2. `uniq` Command

The `uniq` command filters out or identifies repeated lines in a sorted file. It only works on adjacent matching lines, so it's often used in combination with `sort`.

#### Basic Syntax
```bash
uniq [options] [file]
```

#### Common Options
- `-c`: Prefixes each output line with the number of occurrences.
- `-d`: Only prints duplicate lines.
- `-u`: Only prints unique lines.

#### Example 1: Removing Duplicates
```bash
sort fruits.txt | uniq
```

**Output:**
```text
apple
banana
cherry
date
```

Here, `sort` organizes the lines so that duplicates are adjacent, and `uniq` removes them.

#### Example 2: Counting Occurrences
```bash
sort fruits.txt | uniq -c
```

**Output:**
```text
      2 apple
      2 banana
      1 cherry
      1 date
```

The `-c` option shows the number of times each line appears in the file.

#### Example 3: Displaying Only Duplicates
```bash
sort fruits.txt | uniq -d
```

**Output:**
```text
apple
banana
```

The `-d` option makes `uniq` only display lines that are repeated.

### 3. Using `sort` and `uniq` Together

These commands are often used together to first sort the data, then remove duplicates or count occurrences.

#### Example: Finding and Counting Unique Lines
```bash
cat access.log
192.168.1.1
192.168.1.2
192.168.1.1
192.168.1.3
192.168.1.2
192.168.1.1

sort access.log | uniq -c
```

**Output:**
```text
      3 192.168.1.1
      2 192.168.1.2
      1 192.168.1.3
```

In this example:
- **`sort access.log`**: Sorts the IP addresses so that duplicates are adjacent.
- **`uniq -c`**: Counts how many times each IP address appears in the file.

### Summary

- **`sort`**: Organizes the lines of a file or input in a specific order (alphabetical, numerical, etc.).
- **`uniq`**: Removes or identifies duplicate lines in a sorted file.

By using these commands together, you can efficiently process text files, identify patterns, and summarize data.