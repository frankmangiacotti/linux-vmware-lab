# Port and Service Troubleshooting

## Scenario

An application was expected to be available on TCP port 8080, but a connection to the application was not possible.

## Analysis

I first checked the listening ports with `ss` to determine whether anything was listening on port 8080.

Port 8080 was not present.

I then checked whether the expected application process was running using `pgrep` and `ps`.

The `myapp` process was not initially running, so I checked its systemd service with `systemctl`.

After starting the service, it showed as active and running. However, port 8080 was still not listening.

I then inspected the systemd service configuration with `systemctl cat`.

The service was only writing data to `/var/lib/myapp/data.db` and did not start a network application or listen on port 8080.

## Commands

```bash
ss -tuln
pgrep myapp
ps aux | grep myapp
systemctl status myapp
systemctl start myapp
systemctl cat myapp
```

## Verification

The service was running correctly, but no process was listening on port 8080.

The problem was therefore not a stopped systemd service. The service configuration itself did not contain any application listening on port 8080.

## What I learned

I learned that a service being `active (running)` does not necessarily mean that it is listening on the expected network port.

I also learned to troubleshoot a port problem by checking the listening socket, process, systemd service and service configuration.
