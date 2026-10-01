# Disk Usage Investigation

## Scenario

A low disk space warning was investigated on a Linux system. The goal was to identify which filesystem was using the available space.

## Analysis

I used `df -h` to check filesystem usage.

The Linux root filesystem `/` was only 1% full, so there was no significant disk space problem inside the Linux filesystem.

The Windows C: drive mounted at `/mnt/c` was 99% full, with approximately 219 GB used.

I then used `du` to investigate which directories on `/mnt/c` were using disk space.

## Commands

```bash
df -h
du -sh /mnt/c/*
```

## Verification

The investigation showed that the storage problem was related to the Windows C: drive rather than the Linux root filesystem.

## What I learned

I learned how to distinguish filesystem usage with `df` from directory usage with `du`, and how mounted Windows storage appears inside WSL.
