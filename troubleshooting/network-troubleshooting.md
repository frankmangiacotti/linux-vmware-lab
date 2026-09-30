# Network Troubleshooting

## Scenario

A Linux system had a possible network connectivity problem. The goal was to determine whether the problem was related to the network interface, routing, gateway or DNS.

## Analysis

I first checked the network interfaces and IP configuration with `ip a`.

The system had an active `eth0` interface with the address `172.30.24.55/20`.

I then checked the routing table with `ip r` and verified that a default route was configured through `172.30.16.1`.

The gateway did not respond to ICMP ping requests, but the neighbor table showed that the gateway had been resolved at the network layer.

I then tested connectivity to `8.8.8.8`, which succeeded, showing that external IP connectivity was working.

Finally, I tested `google.com`, which also succeeded, confirming that DNS resolution was working.

## Commands

```bash
ip a
ip r
ip route get 172.30.16.1
ip neigh
ping -c 4 172.30.16.1
ping -c 4 8.8.8.8
ping -c 4 google.com
```

## Verification

The network interface and routing configuration were present. Internet connectivity and DNS resolution were working.

The gateway not responding to ping was not enough to conclude that the gateway or route was broken, especially because external connectivity was successful.

## What I learned

I learned how to troubleshoot network connectivity step by step by checking interfaces, routes, the neighbor table, IP connectivity and DNS resolution.
