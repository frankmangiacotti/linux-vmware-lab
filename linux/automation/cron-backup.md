# Automated Cron Backup

## Scenario

I created a simple automated backup system for a log file. The goal was to create a compressed backup with a date-based filename and run it automatically every day.

## Analysis

I created a test log file and used `tar` to create a compressed `.tar.gz` backup.

I then added the current date to the backup filename using the `date` command.

After testing the backup manually, I configured a cron job to run the backup automatically every day at 02:00.

## Commands

```bash
mkdir -p ~/lab-data
touch ~/lab-data/server.log
echo "Backup test - server running" > ~/lab-data/server.log

mkdir -p ~/backups

tar -czf ~/backups/server-backup-$(date +%Y-%m-%d).tar.gz ~/lab-data/server.log

crontab -e
crontab -l
systemctl status cron
```

Cron entry:

```cron
0 2 * * * tar -czf /home/frenk/backups/server-backup-$(date +\%Y-\%m-\%d).tar.gz /home/frenk/lab-data/server.log
```

## Verification

I tested the backup manually and verified its contents with `tar -tzf`.

I then temporarily scheduled the cron job for testing and confirmed that a new date-stamped backup file was created automatically.

The final cron schedule was restored to run every day at 02:00.

## What I learned

I learned how to create compressed backups with `tar`, generate date-based filenames with `date`, configure scheduled tasks with `crontab`, and verify that cron jobs are executed correctly.
