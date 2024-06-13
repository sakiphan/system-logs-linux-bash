
# Gather System Logs Script

This script collects system log files and archives them into a compressed file. It is intended to help with system monitoring and troubleshooting by regularly collecting important log files.

## Prerequisites

- The script must be run as the root user.
- The script is designed to work on Linux systems.

## Log Files Collected

The following log files are collected by the script:

- `/var/log/syslog`
- `/var/log/auth.log`
- `/var/log/kern.log`
- `/var/log/dmesg`
- `/var/log/daemon.log`
- `/var/log/messages`

## Usage

1. **Clone the repository or download the script:**

   ```bash
   git clone https://github.com/sakiphan/system-logs-linux-bash
   cd system-logs-linux-bash
   ```

2. **Make the script executable:**

   ```bash
   chmod +x gather_system_logs.sh
   ```

3. **Run the script manually:**

   ```bash
   sudo ./gather_system_logs.sh
   ```

   You should see a message indicating that the log files have been saved to a specified archive file.

4. **Schedule the script to run automatically using cron:**

   Edit the cron job file:

   ```bash
   sudo crontab -e
   ```

   Add the following line to run the script every day at 4 AM (or adjust the schedule as needed):

   ```bash
   0 4 * * * /path/to/gather_system_logs.sh
   ```

   Replace `/path/to/gather_system_logs.sh` with the full path to the script.

## Checking the Archived Log Files

After the script runs, you can find the archived log files in the `/var/log/system_logs/` directory. The files are named with a timestamp, for example:

```
system_logs_YYYYMMDD_HHMMSS.tar.gz
```

To list the contents of an archive file:

```bash
tar -tzf /var/log/system_logs/system_logs_YYYYMMDD_HHMMSS.tar.gz
```

To extract the contents of an archive file:

```bash
mkdir -p /tmp/system_logs_test
tar -xzf /var/log/system_logs/system_logs_YYYYMMDD_HHMMSS.tar.gz -C /tmp/system_logs_test
```

You can then view the individual log files in the `/tmp/system_logs_test/` directory.
