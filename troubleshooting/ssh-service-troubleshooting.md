SSH Service Troubleshooting Lab

Scenario

A colleague could not connect to the Linux server using SSH.

Problem

The SSH service was not available.

Investigation

I first checked the SSH service:

systemctl status ssh

The system reported:

Unit ssh.service could not be found

I then checked the installed OpenSSH packages:

dpkg -l | grep openssh

Only the OpenSSH client was installed. The SSH server was missing.

Solution

I installed the OpenSSH server:

sudo apt install openssh-server

After installation, I checked the SSH socket:

systemctl status ssh.socket

The socket was listening on port 22.

Verification

I tested a real SSH connection:

ssh frenk@localhost

The connection was successful.

I then verified the current user with:

whoami

The result was:

frenk

What I learned

I learned how to troubleshoot a missing SSH service by checking the installed packages, systemd service and socket.

I also learned that systemd can use socket activation: ssh.socket listens for connections and can start ssh.service when a connection arrives.
