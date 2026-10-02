#!/usr/bin/env bash

echo "=== SYSTEM ==="
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo
echo "=== MEMORY ==="
free -h
echo
echo "=== DISK ==="
df -h / /boot
echo
echo "=== NETWORK ==="
ip -br address
ip route
echo
echo "=== SSH SERVICE ==="
systemctl is-active ssh
