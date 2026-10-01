# VMware Workstation Lab

## Objective

Build practical virtualization skills with a small VMware Workstation lab and a single Linux virtual machine. This setup supports VCTA study and hands-on practice, but it is not a vSphere, ESXi, or vCenter environment.

## Host

- **Computer:** ASUS X543U
- **CPU:** Intel Core i3-7020U, 2 cores / 4 threads
- **Memory:** 4 GB RAM
- **Hypervisor:** VMware Workstation Pro 26H1u1, build 25688693

Because the host has limited memory, the lab uses one VM at a time with conservative resource settings.

## Virtual machine

- **Name:** Ubuntu VCTA Lab
- **Guest OS:** Ubuntu Server 26.04.1 LTS, minimized installation, AMD64
- **CPU:** 1 virtual processor, 1 core
- **Memory:** 2 GB
- **Virtual disk:** 20 GB, split into multiple files
- **Storage:** LVM with ext4; disk encryption disabled
- **Network:** NAT through VMware VMnet8
- **Network interface:** `ens33`
- **Observed DHCP address:** `192.168.19.128/24`
- **Observed default gateway:** `192.168.19.2`
- **Remote access:** OpenSSH Server enabled

The guest address is assigned by DHCP and may change. Check the current address with `ip -br a`.

## Completed exercises

### Confirm the guest system

```bash
hostnamectl
```

Confirmed Ubuntu Server 26.04.1 LTS running on VMware virtual hardware. The guest hostname is `ubuntuvcta`.

### Inspect the guest network

```bash
ip -br a
ip route
```

The guest received `192.168.19.128/24` on `ens33`. Its default route used the VMware NAT gateway at `192.168.19.2`.

### Check DNS resolution

```bash
getent hosts ubuntu.com
```

The command returned DNS results for `ubuntu.com`.

### Connect to the guest over SSH

From Windows PowerShell:

```powershell
ssh labuser@192.168.19.128
```

The first connection prompted for host-key confirmation. After accepting it and entering the guest password, the SSH session opened successfully.

## Useful commands

```bash
hostnamectl
ip -br a
ip route
systemctl is-active ssh
getent hosts ubuntu.com
```

The minimized installation does not include `ping` by default. The `ping` command returned `command not found`; DNS and network configuration were checked with the commands above instead.

## Next lab exercises

- Compare VMware NAT and Host-only networking and record how connectivity changes.
- Create a snapshot before a configuration change, then revert to it. A snapshot is useful for rollback but is not a backup.
- Inspect the VM hardware settings and virtual disk files.
- Practice diagnosing SSH, DNS, and network-route problems.

## Evidence

Store relevant screenshots in [`../screenshots/`](../screenshots/). Avoid including passwords, SSH private keys, or machine-specific identifiers.

## Scope and limitations

This is a lightweight, single-VM lab for learning basic virtualization and guest administration concepts. It does not simulate vSphere clusters or provide hands-on practice with ESXi, vCenter, vMotion, High Availability, or Fault Tolerance.
