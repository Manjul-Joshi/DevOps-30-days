## Task 1: Learn and practice using grep, sed, and awk. 

`grep`, `sed`, and `awk` are powerful text-processing tools in Linux. Each of these tools serves different purposes but is often used together to manipulate and analyze text data. Below is a detailed explanation and examples of each tool.

### 1. `grep`: Search for Patterns in Text

**`grep`** is used to search for specific patterns within text files or output. It stands for "Global Regular Expression Print."

#### Syntax:
```bash
grep [options] pattern [file...]
```

#### Common Options:
- **`-i`**: Ignore case (case-insensitive search).
- **`-v`**: Invert match (select lines that do not match the pattern).
- **`-r`**: Recursively search directories.
- **`-n`**: Display line numbers with output lines.

#### Examples:

1. **Basic Search**:
   ```bash
   grep "hello" file.txt
   ```
   - Searches for the word "hello" in `file.txt`.

2. **Case-Insensitive Search**:
   ```bash
   grep -i "hello" file.txt
   ```
   - Searches for "hello" regardless of case (matches "Hello", "HELLO", etc.).

3. **Search for Lines Not Containing a Pattern**:
   ```bash
   grep -v "error" log.txt
   ```
   - Displays all lines in `log.txt` that do not contain the word "error."

4. **Recursive Search in Directory**:
   ```bash
   grep -r "TODO" /path/to/code/
   ```
   - Searches for "TODO" in all files under `/path/to/code/`.

5. **Show Line Numbers**:
   ```bash
   grep -n "function" script.sh
   ```
   - Displays lines containing "function" along with line numbers in `script.sh`.

### 2. `sed`: Stream Editor for Modifying Text

**`sed`** is a stream editor used for filtering and transforming text. It can be used to search, find and replace, insert, and delete text.

#### Syntax:
```bash
sed [options] 'command' [file...]
```

#### Common Commands:
- **`s/pattern/replacement/`**: Substitute pattern with replacement.
- **`d`**: Delete lines.
- **`p`**: Print lines.
- **`-i`**: Edit files in place (without output to the terminal).

#### Examples:

1. **Basic Substitution**:
   ```bash
   sed 's/old/new/' file.txt
   ```
   - Replaces the first occurrence of "old" with "new" in each line of `file.txt`.

2. **Global Substitution**:
   ```bash
   sed 's/old/new/g' file.txt
   ```
   - Replaces all occurrences of "old" with "new" in each line.

3. **In-Place File Editing**:
   ```bash
   sed -i 's/old/new/g' file.txt
   ```
   - Replaces all occurrences of "old" with "new" directly in `file.txt`.

4. **Delete Lines Containing a Pattern**:
   ```bash
   sed '/pattern/d' file.txt
   ```
   - Deletes all lines containing "pattern" from `file.txt`.

5. **Print Specific Lines**:
   ```bash
   sed -n '3p' file.txt
   ```
   - Prints only the third line of `file.txt`.

6. **Insert Text After a Pattern**:
   ```bash
   sed '/pattern/a\New text' file.txt
   ```
   - Inserts "New text" after every line that matches "pattern".

### 3. `awk`: Text Processing and Data Extraction

**`awk`** is a powerful programming language and command-line utility for pattern scanning and processing. It is used for text extraction and reporting.

#### Syntax:
```bash
awk 'pattern {action}' [file...]
```

#### Common Features:
- **`$1, $2, ...`**: Refers to the first, second, etc., fields in a line.
- **`NR`**: Number of the current record (line number).
- **`FS`**: Field separator (default is whitespace).

#### Examples:

1. **Print Specific Fields**:
   ```bash
   awk '{print $1, $3}' file.txt
   ```
   - Prints the first and third fields of each line in `file.txt`.

2. **Print Lines Matching a Pattern**:
   ```bash
   awk '/error/ {print $0}' log.txt
   ```
   - Prints lines in `log.txt` that contain the word "error".

3. **Calculate Sum of a Column**:
   ```bash
   awk '{sum += $2} END {print sum}' file.txt
   ```
   - Sums up all values in the second field of `file.txt`.

4. **Field Separator**:
   ```bash
   awk -F, '{print $1, $2}' file.csv
   ```
   - Uses a comma as the field separator and prints the first two fields from `file.csv`.

5. **Filter by a Condition**:
   ```bash
   awk '$3 > 50' data.txt
   ```
   - Prints lines where the value in the third field is greater than 50.

6. **Print Line Number with Content**:
   ```bash
   awk '{print NR, $0}' file.txt
   ```
   - Prints each line with its line number from `file.txt`.

### Summary

- **`grep`**: Best for searching text and patterns.
- **`sed`**: Ideal for text substitution, deletion, and basic text transformations.
- **`awk`**: Powerful for text extraction, reporting, and field-based operations.

These tools are often used together in pipelines for complex text-processing tasks in Linux.