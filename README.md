# Backup Script with 5-Day Rotation

## **Introduction**
This script automates the process of creating backups for a specified directory and implements a backup rotation mechanism to manage storage space efficiently.

---

## **What is Backup Rotation?**
Backup rotation is a process of systematically managing backups by retaining only the most recent copies and deleting older ones. This approach ensures:

1. **Efficient Storage Utilization**: Prevents disk space from being consumed by redundant backups.
2. **Quick Recovery**: Ensures access to recent backups without shifting through outdated copies.
3. **Streamlined Maintenance**: Simplifies the process of managing backup files.

By limiting the number of backups retained (e.g., the last 5), backup rotation achieves a balance between redundancy and storage efficiency.

---

## **Why is Backup Rotation Required?**

1. **Limited Storage Capacity**: Disk space is finite; retaining too many backups can exhaust available space quickly.
2. **Prevent Redundancy**: Keeping excessive backups often results in duplication and unnecessary clutter.
3. **Focus on Relevance**: Only the most recent backups are typically useful for recovery.
4. **Maintenance Efficiency**: Automating the rotation reduces manual intervention, saving time and effort.

Without backup rotation, backup systems may become unsustainable over time, leading to storage constraints and inefficiencies.

---

## **About This Code**
This script creates compressed backups of a source directory and retains only the latest 5 backups in the target directory. The older backups are automatically deleted to optimize storage space.

---

## **Features**
1. **Automated Backup Creation**: Compresses the source directory into a zip file with a timestamped name.
2. **Backup Rotation**: Ensures only the 5 most recent backups are retained.
3. **Error Handling**: Provides clear error messages if something goes wrong during backup creation or file deletion.

---

## **Explanation of the Code Setup**

1. **Source Directory Setup**:
   - A directory named `data` was created at `/home/ubuntu/`.
   - This directory (`/home/ubuntu/data`) contains 5 files: `file1.txt`, `file2.txt`, `file3.txt`, `file4.txt`, and `file5.txt`.

2. **Script File**:
   - A script file named `backup.sh` was created in `/home/ubuntu/`.
   - This file contains the backup and rotation code described in this document.

3. **Destination Directory Setup**:
   - A directory named `backups` was created at `/home/ubuntu/`.
   - This directory (`/home/ubuntu/backups`) is where all the backups are stored.
   - After running the script, the backups are compressed into zip files and saved in this directory. The rotation mechanism ensures that only the latest 5 backups are retained.

---

## **How the Script Works**

1. **Usage Check**: Validates that the source and backup directories are provided as arguments.
2. **Backup Rotation**:
   - Lists all existing backups in the target directory.
   - Deletes backups if there are more than 5, starting with the oldest.
3. **Backup Creation**:
   - Creates a compressed zip file of the source directory, named with the current timestamp.

---

## **Code Walkthrough**

### **Functions**

1. **`display_usage`**:
   - Displays usage instructions if incorrect arguments are provided.

2. **`perform_rotation`**:
   - Checks the number of backups in the target directory.
   - Deletes backups exceeding the 5 most recent files.

3. **`create_backup`**:
   - Creates a timestamped zip file of the source directory in the backup directory.

### **Execution Flow**
1. Validate arguments.
2. Execute `perform_rotation` to clean up old backups.
3. Execute `create_backup` to generate a new backup.

---

## **Usage**

### **Script Arguments**
1. `<path to source>`: The directory to be backed up.
2. `<path to backup>`: The directory where the backup will be stored.

### **Example**
```bash
./backup.sh /home/ubuntu/data /home/ubuntu/backups
```

### **Setting Executable Permissions**
Before running the script, ensure it has executable permissions:
```bash
chmod +x backup.sh
```

---

## **Benefits**
1. Automates regular backups with minimal user intervention.
2. Prevents clutter in the backup directory by keeping only relevant files.
3. Ideal for systems with limited storage space.

---

## **Limitations**
- Requires `zip` to be installed on the system.
- Backup rotation is limited to 5 files by default (modifiable in the script).

---

## **Future Enhancements**
- Add email notifications for backup completion or failures.
- Support for incremental backups to reduce storage space further.
- Make the number of backups retained configurable through arguments or a configuration file.
