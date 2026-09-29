Disk and File Permissions Troubleshooting Lab

Scenario

An application was running but could not write data to its database file.

Problem

The application reported:

Permission denied

when trying to write to:

/var/lib/myapp/data.db

Investigation

I first checked the available disk space:

df -h

The Linux root filesystem was only 1% full, so disk space was not the problem.

I then checked inode usage:

df -i

The root filesystem was also only 1% full in terms of inodes.

I checked the file permissions and ownership:

ls -l /var/lib/myapp/data.db

The file was owned by root:root and had:

-rw-r--r--

The application service was configured to run as the myapp user.

I also checked the directory permissions:

ls -ld /var /var/lib /var/lib/myapp

The directories had 755 permissions, so the myapp user could access the path.

Troubleshooting

I created a systemd service that ran as myapp and attempted to write to the database file.

The service was running, but the logs showed:

Permission denied

I then changed the ownership of the database file:

sudo chown myapp /var/lib/myapp/data.db

I verified that myapp could write to the file directly:

sudo -u myapp sh -c 'echo test >> /var/lib/myapp/data.db'

The write was successful.

Finally, I restarted the service:

sudo systemctl restart myapp

Verification

I checked the service status:

sudo systemctl status myapp

The service was active and running without new Permission denied errors.

What I learned

I practiced troubleshooting a Linux application that could not write to a file.

I learned to check disk space, inode usage, file ownership, file permissions, directory permissions and the user running a service before changing the configuration.

I also practiced using systemctl, df, ls, chown and sudo -u during troubleshooting.
