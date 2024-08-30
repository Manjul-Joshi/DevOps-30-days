## Task 2: Write a script to search and replace text in files.
```bash
#!/bin/sh
cat sample.txt|grep -i -n "si"
sed '/si/a\New text ' sample2.txt
sed '/New text /a\si' sample2.txt
```
Let's break down each of the provided Bash commands step by step.

### 1. `cat sample2.txt | grep -i -n "si"`

#### Explanation:
- **`cat sample2.txt`**:
  - The `cat` command reads the content of the file `sample2.txt` and outputs it to the standard output (usually the terminal).
  
- **`|` (Pipe)**:
  - The pipe `|` takes the output of the command on the left (`cat sample2.txt`) and passes it as input to the command on the right (`grep -i -n "si"`).

- **`grep -i -n "si"`**:
  - **`grep`**: Searches for a pattern within text.
  - **`-i`**: Makes the search case-insensitive. This means it will match "si", "Si", "SI", "sI", etc.
  - **`-n`**: Includes the line number in the output, showing where in the file the pattern was found.
  - **`"si"`**: The pattern being searched for in the text.

#### Combined Command:
- The entire command searches for occurrences of the pattern "si" (case-insensitive) in `sample2.txt` and prints each matching line along with its line number.

#### Example Output:
If `sample2.txt` contains:
```text
This is a simple file.
Si can also match this line.
Another line.
```
The command would output:
```bash
1:This is a simple file.
2:Si can also match this line.
```

### 2. `sed '/si/a\New text ' sample2.txt`

#### Explanation:
- **`sed`**:
  - `sed` is a stream editor used for performing basic text transformations on an input stream (a file or input from a pipeline).

- **`'/si/'`**:
  - This is a search pattern. The command searches for lines in `sample2.txt` that contain the pattern "si".
  - Unlike `grep`, this pattern is case-sensitive by default in `sed`. So it will only match "si", not "Si", "SI", etc.

- **`a\New text `**:
  - `a` is the `sed` command to append text after the matched pattern.
  - `\New text ` is the text to be inserted after each line that matches "si".

- **`sample2.txt`**:
  - The file on which `sed` operates.

#### Combined Command:
- This command searches for lines containing "si" in `sample2.txt` and appends the text "New text " immediately after each matching line.

#### Example:
Given the following `sample2.txt`:
```text
This is a simple file.
Another line.
Si will not match this.
This line contains si.
```
After running the command, the output would be:
```text
This is a simple file.
Another line.
Si will not match this.
This line contains si.
New text 
```

### 3. `sed '/New text /a\si' sample2.txt`

#### Explanation:
- **`sed`**:
  - Again, `sed` is being used to edit the text stream.

- **`'/New text /'`**:
  - This is the search pattern. `sed` will search for lines that contain "New text ".

- **`a\si`**:
  - This tells `sed` to append the text "si" after each line that matches the pattern "New text ".

- **`sample2.txt`**:
  - The file being processed.

#### Combined Command:
- The command searches for lines containing "New text " in `sample2.txt` and appends "si" immediately after each matching line.

#### Example:
Continuing from the previous example where "New text " was added:
```text
This is a simple file.
Another line.
Si will not match this.
This line contains si.
New text 
```
After running this command, the output would be:
```text
This is a simple file.
Another line.
Si will not match this.
This line contains si.
New text 
si
```

### Summary of the Commands:
1. **`cat sample2.txt | grep -i -n "si"`**: 
   - Searches for and displays all lines containing "si" (case-insensitive) in `sample2.txt`, showing the line numbers.

2. **`sed '/si/a\New text ' sample2.txt`**:
   - Appends "New text " after each line that contains the pattern "si" in `sample2.txt`.

3. **`sed '/New text /a\si' sample2.txt`**:
   - Appends "si" after each line that contains the pattern "New text " in `sample2.txt`.

Each of these commands is a useful example of how `grep`, `sed`, and other Linux text-processing tools can be used to search, modify, and manipulate text files in flexible and powerful ways.