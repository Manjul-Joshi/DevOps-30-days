## Task 5: Learn about file permissions and modify them using chmod. 

File permissions in Linux control who can read, write, or execute a file or directory. These permissions are crucial for system security and proper functioning of multi-user environments.

### File Permission Types

Linux file permissions are divided into three categories:
1. **User (u)**: The owner of the file.
2. **Group (g)**: The group associated with the file.
3. **Others (o)**: All other users.

Each category can have three types of permissions:
- **Read (r)**: Permission to read the contents of the file or list the directory's contents.
- **Write (w)**: Permission to modify the file or directory's contents.
- **Execute (x)**: Permission to execute the file as a program or script, or enter the directory.

### Understanding File Permission Representation

Permissions are represented by a string of 10 characters:
- The first character represents the file type:
  - **`-`**: Regular file
  - **`d`**: Directory
  - **`l`**: Symbolic link
  - **`c`**: Character device file
  - **`b`**: Block device file

- The next nine characters represent the permissions for user, group, and others in sets of three:
  - **`r`**: Read permission
  - **`w`**: Write permission
  - **`x`**: Execute permission
  - **`-`**: No permission

Example: `-rwxr-xr--`
- **`-`**: Regular file
- **`rwx`**: User has read, write, and execute permissions.
- **`r-x`**: Group has read and execute permissions.
- **`r--`**: Others have read-only permission.

### Changing File Permissions

Permissions can be changed using the `chmod` command, either numerically or symbolically.

### Numerical Representation of Permissions

Each permission type is represented by a number:
- **Read (r) = 4**
- **Write (w) = 2**
- **Execute (x) = 1**

You add these values to set the desired permissions. For example:
- **`7`** (4+2+1) = `rwx` (read, write, execute)
- **`5`** (4+0+1) = `r-x` (read, execute)
- **`6`** (4+2+0) = `rw-` (read, write)

### Examples of File Permissions

1. **Full Permissions for User, Read-Only for Group and Others:**
   ```bash
   chmod 744 filename
   ```
   - **Permissions:** `-rwxr--r--`
   - **Explanation:** User can read, write, and execute; group and others can only read.

2. **Read and Write for User and Group, No Permissions for Others:**
   ```bash
   chmod 660 filename
   ```
   - **Permissions:** `-rw-rw----`
   - **Explanation:** User and group can read and write; others have no permissions.

3. **Read, Write, and Execute for All:**
   ```bash
   chmod 777 filename
   ```
   - **Permissions:** `-rwxrwxrwx`
   - **Explanation:** User, group, and others have full permissions.

4. **Read and Execute for All, Write for User Only:**
   ```bash
   chmod 755 filename
   ```
   - **Permissions:** `-rwxr-xr-x`
   - **Explanation:** User can read, write, and execute; group and others can read and execute.

5. **No Permissions for Others, Full Permissions for User and Group:**
   ```bash
   chmod 770 filename
   ```
   - **Permissions:** `-rwxrwx---`
   - **Explanation:** User and group have full permissions; others have no permissions.

### Symbolic Representation of Permissions

You can also change permissions using symbolic notation:
- **`u`**: User
- **`g`**: Group
- **`o`**: Others
- **`a`**: All (user, group, and others)

Examples:
1. **Add Execute Permission for User:**
   ```bash
   chmod u+x filename
   ```
   - Adds execute permission for the user.

2. **Remove Write Permission for Group:**
   ```bash
   chmod g-w filename
   ```
   - Removes write permission for the group.

3. **Set Read and Execute for All:**
   ```bash
   chmod a=rx filename
   ```
   - Sets read and execute permissions for everyone (user, group, and others).

### Viewing File Permissions

You can view the permissions of files in a directory using the `ls -l` command:

```bash
ls -l
```

Example output:
```bash
-rwxr-xr--
```

This output provides detailed information about each file’s permissions.

### Summary

- **File permissions** control access to files and directories.
- **User, group, and others** can have **read, write, and execute** permissions.
- Permissions can be viewed with `ls -l` and modified using `chmod`.
- Permissions are critical for system security and managing file access in multi-user environments.