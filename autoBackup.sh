#!/bin/bash

# Prompt to get Backup Path directory
read -p "Enter the path of Backup Directory(e.g. /path/of/backup/dir): " BAK_DIR

# Prompt to get Destination Path directory
read -p "Enter the path to Destination Directory(e.g. /path/to/destination/dir): " DEST_DIR

# Create a timestamp for the backup filename
TIMESTAMP=$(date +%Y-%m-%d_%H%M%S)

#Logging status
LOG_FILE=$DEST_DIR/LOG_FILE

# Create the backup archive
tar -czf $DEST_DIR/backup_$TIMESTAMP.tar.gz -C $BAK_DIR .

# Copy the backup archive to the destination directory
cp $DEST_DIR/backup_$TIMESTAMP.tar.gz $DEST_DIR/backup_latest.tar.gz 

# Log status of operation
echo "$(date "+%Y-%m-%d %H:%M:%S"): Backup successful!" >> $LOG_FILE

# Print the last line of log file
tail -1 $DEST_DIR/LOG_FILE

