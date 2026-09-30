# CPU Usage Investigation

## Scenario

A Linux system was reported to be slow. The goal was to investigate CPU and memory usage and identify the process causing the problem.

## Analysis

I used `top` to monitor CPU usage and identify processes consuming system resources.

A temporary CPU spike was observed for `systemd-journald`. I checked the process with `ps` to identify it and monitored the system again.

The CPU usage returned to normal, indicating that the spike was temporary rather than a persistent problem.

I also checked memory usage with `free` and the system load with `uptime`.

## Commands

```bash
top
ps -fp 83
free -h
uptime
```

## Verification

The system returned to normal CPU usage. Memory and swap usage were also normal, with no significant memory pressure.

## What I learned

I learned how to investigate system performance using live process monitoring, process inspection, memory usage and load average.
