#!/bin/bash

<<readme
This is a script for backup with 5 days rotation

Usage:
./backup.sh <path to your source> <path to backup folder>
readme

function display_usage {
    echo "Usage: ./backup.sh <path to your source> <path to backup folder>"
}

# Check if arguments are provided
if [ $# -eq 0 ]; then
    display_usage
    exit 1
fi

# Set variables
source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

# Function to create a backup
function create_backup {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
    if [ $? -eq 0 ]; then
        echo "Backup generated successfully for ${timestamp}"
    else
        echo "Backup creation failed."
    fi
}

# Function to perform backup rotation (keeping only 5 backups)
function perform_rotation {
    # Get the list of backup files sorted by modification time (newest first)
    backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
    
    # Debug output for the number of backups found
    echo "Backups found: ${#backups[@]}"

    # If there are more than 5 backups, delete the oldest ones
    if [ "${#backups[@]}" -gt 5 ]; then
        echo "Performing rotation for more than 5 backups."
        
        # Delete backups older than 5 days (keep latest 5)
        files_to_delete="${#backups[@]} - 5"
        for (( i=5; i<${#backups[@]}; i++ )); do
            echo "Deleting backup: ${backups[$i]}"
            rm -f "${backups[$i]}"
        done
    else
        echo "No rotation needed, less than 5 backups."
    fi
}

# Run rotation before creating a new backup
perform_rotation

# Create the backup
create_backup

