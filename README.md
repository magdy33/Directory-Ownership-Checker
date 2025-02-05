# Directory Ownership Checker Script

## Overview
This script is designed to identify directories inside the `/home/` directory that are **not associated** with any user listed in the `/etc/passwd` file. This can be useful for system administrators who need to clean up unused or orphaned directories.

## Usage
### Running the Script
```bash
./dir_assign.sh
```
Ensure the script has execution permissions:
```bash
chmod +x dir_assign.sh
```

## How It Works
1. The script navigates to the `/home/` directory.
2. It iterates through each directory present inside `/home/`.
3. For each directory, it checks if there is a corresponding entry in the `/etc/passwd` file.
4. If no user is found for a directory, it prints a message indicating that the directory is not attached to any user.

## Script Breakdown
```bash
cd /home/
```
- Changes the working directory to `/home/`.

```bash
for DIR in *
```
- Loops through each directory inside `/home/`.

```bash
CHK=$(grep -c "/home/$DIR" /etc/passwd)
```
- Uses `grep -c` to count occurrences of the directory path inside `/etc/passwd`.
- If a match is found, it means a user is associated with that directory.

```bash
if [ $CHK -ge 1 ]; then
    continue
else
    echo "$DIR is not attached to a user"
fi
```
- If the count is 1 or more, the script skips to the next directory.
- If no match is found, it prints the directory name indicating it has no associated user.

## Author & Maintenance
- **Author:** Magdi_
- **Last Modified:** *[Add date]*
- **License:** Open-source, modify as needed.

## Potential Enhancements
- Add logging to save output to a file.
- Include an option to automatically delete orphaned directories (use with caution).
- Enhance error handling in case of permission issues.

---
🚀 *Happy Scripting!*

