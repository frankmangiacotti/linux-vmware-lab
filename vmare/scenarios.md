# VMware Lab Scenarios

## Lab environment

- Hypervisor: VMware Workstation Pro
- Guest OS: Ubuntu Server 26.04.1 LTS
- VM resources: 2 GB RAM, 1 processor, 20 GB virtual disk
- Network adapter: NAT or Host-only, depending on the scenario
- SSH user: `labuser`

## Scenario 1: NAT and Host-only networking

### NAT

With the VM network adapter set to NAT, Ubuntu received the address `192.168.19.128/24`.

Command used:

```bash
ip route
The default route was through 192.168.19.2 on ens33. The NAT network was 192.168.19.0/24.
Host-only
After shutting down the VM and changing its network adapter to Host-only, Ubuntu received 192.168.16.128/24.
Command used:
ip route
The output showed the local network 192.168.16.0/24 and no default route. Windows could still connect to Ubuntu over SSH at 192.168.16.128.
What I learned
NAT gives the VM a route through VMware to external networks. Host-only provides a private network for communication between the host and VM, without a default route to external networks.
Scenario 2: Create and restore a snapshot
Created a VMware snapshot named Ubuntu base - NAT.
To verify the restore:
1. Created a temporary file after the snapshot:touch ~/prova-dopo-snapshot.txt
2. Shut down the VM and restored the snapshot.
3. Checked for the file:ls -l ~/prova-dopo-snapshot.txt
The file was no longer present, confirming that the VM returned to the snapshot state.
What I learned
A snapshot can return a VM to an earlier state. Changes made after that snapshot can be lost when it is restored.
Scenario 3: Inspect VM resources and disk usage
VMware settings showed:
- Memory: 2 GB
- Processors: 1
- Virtual disk: 20 GB
Commands used inside Ubuntu:
df -h
The root filesystem / was about 9.8 GB, with about 4.9 GB available and 47% used. The /boot filesystem was about 1.8 GB, with 5% used.
What I learned
The virtual disk's total size and the space available in a mounted filesystem are different measurements. df -h reports filesystem usage and free space.
Scenario 4: Check SSH service
Command used:
systemctl status ssh --no-pager
The SSH service was active and running. The service log also showed a successful SSH login for labuser from the Windows host.
What I learned
systemctl status helps check whether a service is running. The SSH login log provides evidence that the host connected successfully to the VM.
