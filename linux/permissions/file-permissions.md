Linux User, Group and File Permissions Lab

Scenario

The goal of this lab was to practice Linux user management, groups, sudo privileges, file ownership and permissions.

What I did

* Added administrative privileges to the frenk user.
* Created a new user called marco.
* Created the sysadmins group.
* Added marco to the sysadmins and sudo groups.
* Checked if /opt/app/config.conf existed.
* Created the directory and file because they did not exist.
* Set root as the owner and sysadmins as the group.
* Applied 640 permissions to the file.

Final configuration

Owner: root

Group: sysadmins

Permissions: 640

The permissions allow root to read and modify the file, while members of sysadmins can only read it. Other users have no access.

Verification

I tested the configuration with different users.

marco, who belongs to sysadmins, was able to read the file but could not modify it.

A user outside the sysadmins group could not read the file.

Troubleshooting

The configuration file did not initially exist, so I checked the filesystem and created it.

I also verified that chown was available with:

which chown

The command returned:

/usr/bin/chown

What I learned

I practiced Linux user and group management, sudo privileges, file ownership, permissions and basic troubleshooting.
