## Task 4: Implement error handling in your scripts. 
```bash
#!/bin/bash
ls /nonexistent_directory
if [ $? -ne 0 ]
then
  echo "Command failed"
  exit 1
else
  echo "Command Successful"
fi
```
This script is a basic Bash script that checks the success or failure of a command (`ls /nonexistent_directory`) and takes action based on whether the command succeeds or fails. Let's break it down step by step:

### Script Breakdown

#### 1. `#!/bin/bash`
- **Shebang**: The `#!/bin/bash` line at the beginning of the script specifies the script interpreter. It tells the system to use the Bash shell to execute the script.

#### 2. `ls /nonexistent_directory`
- **Command**: The script attempts to list the contents of a directory called `/nonexistent_directory` using the `ls` command.
- **Expected Outcome**: Since `/nonexistent_directory` does not exist, the `ls` command will fail, and an error message will be printed to the terminal.

#### 3. `if [ $? -ne 0 ]`
- **`$?` Variable**: This special variable holds the exit status of the last executed command. In Unix-like systems, an exit status of `0` indicates that the command was successful, while a non-zero value indicates a failure or error.
- **Condition**: `[ $? -ne 0 ]` checks if the exit status of the `ls` command is not equal to `0`.
  - **`-ne`**: This stands for "not equal" in Bash.
  - If the condition is true (meaning the command failed), the script will execute the code inside the `then` block.

#### 4. `then`
- **Code Block**: If the condition `[ $? -ne 0 ]` is true, meaning the `ls` command failed, the script will execute the commands in this block.

#### 5. `echo "Command failed"`
- **Output**: This command prints the message "Command failed" to the terminal to inform the user that the `ls` command did not succeed.

#### 6. `exit 1`
- **Exit**: The `exit 1` command terminates the script and returns an exit status of `1` to the shell. In scripts, an exit status of `1` (or any non-zero value) typically indicates that the script encountered an error.

#### 7. `else`
- **Alternative Block**: If the condition `[ $? -ne 0 ]` is false (meaning the `ls` command succeeded), the script will execute the commands inside this `else` block.

#### 8. `echo "Command Successful"`
- **Output**: This command prints the message "Command Successful" to the terminal to inform the user that the `ls` command succeeded. However, in this specific script, this line will never be executed because `/nonexistent_directory` does not exist, and the `ls` command will always fail.

### Example Output
When the script is run, the expected output would be:
```bash
ls: cannot access '/nonexistent_directory': No such file or directory
Command failed
```
- The `ls` command fails because the directory does not exist, triggering the script to print "Command failed" and exit with status `1`.

### Summary
- The script attempts to list a directory that doesn’t exist.
- It checks the exit status of the `ls` command using `$?`.
- If the command fails (exit status is not `0`), it prints "Command failed" and exits with a status of `1`.
- If the command were successful (which it won't be in this case), it would print "Command Successful" instead.
