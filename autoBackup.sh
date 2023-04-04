#!/bin/bash

# Prompt to get Backup Path directory
read -p "Enter the path of Backup Directory: " BAK_DIR

# Prompt to get Destination Path directory
read -p "Enter the path to Destination Directory:(e.g. /path/to/destination/dir " DEST_DIR

# Create a timestamp for the backup filename
TIMESTAMP=$(date +%Y-%m-%d_%H%M%S)

# Create the backup archive
tar -czf $DEST_DIR/backup_$TIMESTAMP.tar.gz -C $BAK_DIR .

# Copy the backup archive to the destination directory
cp $DEST_DIR/backup_$TIMESTAMP.tar.gz $DEST_DIR/backup_latest.tar.gz 

echo "Done"
