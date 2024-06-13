#!/bin/bash

# Verify that the script is being run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

# Directory where log files will be saved
LOG_DIR="/var/log/system_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="$LOG_DIR/system_logs_$TIMESTAMP.tar.gz"

# Create the log directory if it doesn't exist
mkdir -p $LOG_DIR

# List of log files to collect
LOG_FILES=(
    "/var/log/syslog"
    "/var/log/auth.log"
    "/var/log/kern.log"
    "/var/log/dmesg"
    "/var/log/daemon.log"
    "/var/log/messages"
)

# Add log files to the archive
tar -czf $ARCHIVE_FILE "${LOG_FILES[@]}"

# Notify that the process is complete
echo "Log files have been saved to $ARCHIVE_FILE."
