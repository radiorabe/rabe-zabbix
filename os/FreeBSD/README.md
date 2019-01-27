# Zabbix FreeBSD monitoring
Monitoring [FreeBSD](https://www.freebsd.org/) systems.

Items, triggers and graphs for monitoring various basic FreeBSD operating
system parameters. Including low-level discovery rules for file systems and
network interfaces.

The template uses macros (with [macro
contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context)
where feasible) for trigger thresholds which can be easily adapted to your
specific needs.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_OS_FreeBSD_active.xml`](Template_OS_FreeBSD_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template OS FreeBSD active
OS template for monitoring FreeBSD systems.
### Items
* Maximum number of opened files (`kernel.maxfiles`)  
  The maximum number of opened files supported/allowed by the kernel.
* Maximum number of processes (`kernel.maxproc`)  
  The maximum number of processes supported/allowed by the kernel.
* Number of running processes (`proc.num[,,run]`)  
  The number of processes in running state.
* Number of processes (`proc.num[]`)  
  The total number of processes in any state.
* Host boot time (`system.boottime`)  
  The system's boot time.
* Interrupts per second (`system.cpu.intr`)  
  Device interrupts per second.
* Processor load (1 min average per core) (`system.cpu.load[percpu,avg1]`)  
  The processor 1 minute average load is calculated as system CPU load divided by the number of CPU cores.
* Processor load (5 min average per core) (`system.cpu.load[percpu,avg5]`)  
  The processor 5 minute average load is calculated as system CPU load divided by the number of CPU cores.
* Processor load (15 min average per core) (`system.cpu.load[percpu,avg15]`)  
  The processor 15 minute average load is calculated as system CPU load divided by the number of CPU cores.
* Context switches per second (`system.cpu.switches`)  
  CPU context switches per second.
* CPU avg5 time () (`system.cpu.util[,idle,avg5]`)  
  CPU 5 minute average nice time (the time the CPU has spent doing nothing).
* CPU avg5 time () (`system.cpu.util[,interrupt,avg5]`)  
  CPU 5 minute average interrupt time (the amount of time the CPU has been servicing hardware interrupts).
* CPU avg5 time () (`system.cpu.util[,nice,avg5]`)  
  CPU 5 minute average nice time (the time the CPU has spent running users' processes that have been niced).
* CPU avg5 time () (`system.cpu.util[,system,avg5]`)  
  CPU 5 minute average system time (the time the CPU has spent running the kernel and its processes).
* CPU avg5 time () (`system.cpu.util[,user,avg5]`)  
  CPU user time (the time the CPU has spent running users' processes that are not niced).
* Host name (`system.hostname`)  
  The system's host name.
* Host local time (`system.localtime`)  
  The system's local time.
* Free swap space (`system.swap.size[,free]`)  
  The free swap space in bytes.
* Free swap space in % (`system.swap.size[,pfree]`)  
  The free swap space in percent.
* Total swap space (`system.swap.size[,total]`)  
  The total swap space in bytes.
* System information (`system.uname`)  
  The information as normally returned by `uname -a`
* System uptime (`system.uptime`)  
  The system's uptime in seconds.
* Number of logged in users (`system.users.num`)  
  Number of users who are currently logged in.
* Overall block device read (`vfs.dev.read[all,bytes]`)  
  Overall block device read statistics in bytes per seconds.
* Overall block device write (`vfs.dev.write[all,bytes]`)  
  Overall block device write statistics in bytes per seconds.
* Checksum of /etc/passwd (`vfs.file.cksum[/etc/passwd]`)  
  The current checksum of the `/etc/passwd`file.
* Available memory (`vm.memory.size[available]`)  
  The available memory in bytes (inactive + cached + free memory).
* Buffered memory (`vm.memory.size[buffers]`)  
  The buffered memory in bytes (cache for things like file system metadata).
* Cached memory (`vm.memory.size[cached]`)  
  The cached memory in bytes (cache for various things),
* Free memory (`vm.memory.size[free]`)  
  The free memory in bytes (memory that is readily available to any entity requesting memory).
* Available memory in % (`vm.memory.size[pavailable]`)  
  The available memory in percent (inactive + cached + free memory).
* Total memory (`vm.memory.size[total]`)  
  The total memory in bytes.
* Unsupported items (`zabbix[host,,items_unsupported]`)  
  The number of unsupported items on this host
### Macros
* `{$OS_FREEBSD_CPU_IDLE_HIGH_THRESHOLD}` (default: 5)
* `{$OS_FREEBSD_CPU_IDLE_HIGH_TIME}` (default: 30m)
* `{$OS_FREEBSD_CPU_IDLE_WARNING_THRESHOLD}` (default: 10)
* `{$OS_FREEBSD_CPU_IDLE_WARNING_TIME}` (default: 30m)
* `{$OS_FREEBSD_CPU_IOWAIT_HIGH_THRESHOLD}` (default: 40)
* `{$OS_FREEBSD_CPU_IOWAIT_HIGH_TIME}` (default: 15m)
* `{$OS_FREEBSD_CPU_IOWAIT_WARNING_THRESHOLD}` (default: 20)
* `{$OS_FREEBSD_CPU_IOWAIT_WARNING_TIME}` (default: 15m)
* `{$OS_FREEBSD_CPU_LOAD_HIGH_THRESHOLD}` (default: 15)
* `{$OS_FREEBSD_CPU_LOAD_HIGH_TIME}` (default: 30m)
* `{$OS_FREEBSD_CPU_LOAD_WARNING_THRESHOLD}` (default: 15)
* `{$OS_FREEBSD_CPU_LOAD_WARNING_TIME}` (default: 15m)
* `{$OS_FREEBSD_FS_FREE_HIGH_THRESHOLD}` (default: 100G)
* `{$OS_FREEBSD_FS_FREE_WARNING_THRESHOLD}` (default: 150G)
* `{$OS_FREEBSD_FS_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$OS_FREEBSD_FS_PFREE_WARNING_THRESHOLD}` (default: 10)
* `{$OS_FREEBSD_MEMORY_AVAILABLE_HIGH_THRESHOLD}` (default: 10G)
* `{$OS_FREEBSD_MEMORY_AVAILABLE_WARNING_THRESHOLD}` (default: 20G)
* `{$OS_FREEBSD_MEMORY_PAVAILABLE_HIGH_THRESHOLD}` (default: 5)
* `{$OS_FREEBSD_MEMORY_PAVAILABLE_WARNING_THRESHOLD}` (default: 10)
* `{$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_THRESHOLD}` (default: 800M)
* `{$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_TIME}` (default: 1h)
* `{$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_THRESHOLD}` (default: 500M)
* `{$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_TIME}` (default: 15m)
* `{$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_THRESHOLD}` (default: 800M)
* `{$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_TIME}` (default: 1h)
* `{$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_THRESHOLD}` (default: 500M)
* `{$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_TIME}` (default: 15m)
* `{$OS_FREEBSD_PROC_NUM_HIGH_THRESHOLD}` (default: 500)
* `{$OS_FREEBSD_PROC_NUM_WARNING_THRESHOLD}` (default: 300)
* `{$OS_FREEBSD_SWAP_FREE_HIGH_THRESHOLD}` (default: 10G)
* `{$OS_FREEBSD_SWAP_FREE_WARNING_THRESHOLD}` (default: 20G)
* `{$OS_FREEBSD_SWAP_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$OS_FREEBSD_SWAP_PFREE_WARNING_THRESHOLD}` (default: 10)
* `{$OS_FREEBSD_TIME_DRIFT_WARNING_THRESHOLD}` (default: 10)
### Discovery
#### Network interface discovery (`net.if.discovery`)
Discovery of network interfaces as defined in global regular expression "Network interfaces for discovery".
##### Item Prototypes
* Incoming $2 packets on $1 (`net.if.in[{#IFNAME},dropped]`)  
  The number of incoming dropped packages per second on the network interface.
* Incoming $2 on $1 (`net.if.in[{#IFNAME},errors]`)  
  The number of incoming errors per second on the network interface.
* Incoming $2 on $1 (`net.if.in[{#IFNAME},packets]`)  
  The number of incoming packages per second on the network interface.
* Incoming network traffic on $1 (`net.if.in[{#IFNAME}]`)  
  The incoming traffic in bits per second on the network interface.
* Outgoing $2 on $1 (`net.if.out[{#IFNAME},errors]`)  
  The number of outgoing errors per second on the network interface.
* Outgoing $2 on $1 (`net.if.out[{#IFNAME},packets]`)  
  The number of outgoing packages per second on the network interface.
* Outgoing network traffic on $1 (`net.if.out[{#IFNAME}]`)  
  The outgoing traffic in bits per second on the network interface.
##### Trigger Prototypes
* Warning: Incoming network usage on {HOST.NAME}:{#IFNAME} is high ( > $1/s over {$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_TIME:"{#IFNAME}"})
  ```
  {Template OS FreeBSD active:net.if.in[{#IFNAME}].avg({$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_TIME:"{#IFNAME}"})} > {$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_THRESHOLD:"{#IFNAME}"}
  ```
  The incoming network usage is above `{$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_THRESHOLD:"{#IFNAME}"}` for the last `{$OS_FREEBSD_NET_IN_BANDWIDTH_WARNING_TIME:"{#IFNAME}"}`
* High: Incoming network usage on {HOST.NAME}:{#IFNAME} is very high ( > $1/s over {$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_TIME:"{#IFNAME}"})
  ```
  {Template OS FreeBSD active:net.if.in[{#IFNAME}].avg({$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_TIME:"{#IFNAME}"})} > {$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_THRESHOLD:"{#IFNAME}"}
  ```
  The incoming network usage is above `{$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_THRESHOLD:"{#IFNAME}"}` for the last `{$OS_FREEBSD_NET_IN_BANDWIDTH_HIGH_TIME:"{#IFNAME}"}`
* Warning: Outgoing network usage on {HOST.NAME}:{#IFNAME} is high ( > $1/s over {$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_TIME:"{#IFNAME}"})
  ```
  {Template OS FreeBSD active:net.if.in[{#IFNAME}].avg({$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_TIME:"{#IFNAME}"})} > {$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_THRESHOLD:"{#IFNAME}"}
  ```
  The outgoing network usage is above `{$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_THRESHOLD:"{#IFNAME}"}` for the last `{$OS_FREEBSD_NET_OUT_BANDWIDTH_WARNING_TIME:"{#IFNAME}"})`
* High: Outgoing network usage on {HOST.NAME}:{#IFNAME} is very high ( > $1/s over {$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_TIME:"{#IFNAME}"})
  ```
  {Template OS FreeBSD active:net.if.in[{#IFNAME}].avg({$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_TIME:"{#IFNAME}"})} > {$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_THRESHOLD:"{#IFNAME}"}
  ```
  The outgoing network usage is above `{$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_THRESHOLD:"{#IFNAME}"}` for the last `{$OS_FREEBSD_NET_OUT_BANDWIDTH_HIGH_TIME:"{#IFNAME}"})`
#### Mounted filesystem discovery (`vfs.fs.discovery`)
Discovery of file systems of different types as defined in global regular expression "File systems for discovery".
##### Item Prototypes
* Free inodes on $1 (`vfs.fs.inode[{#FSNAME},free]`)  
  Free inodes on the filesystem.
* Free inodes on $1 in % (`vfs.fs.inode[{#FSNAME},pfree]`)  
  Free inodes in percent on the filesystem.
* Used inodes on $1 in % (`vfs.fs.inode[{#FSNAME},pused]`)  
  Used inodes in percent on the filesystem.
* Total inodes on $1 (`vfs.fs.inode[{#FSNAME},total]`)  
  Total inodes on the filesystem.
* Used inodes on $1 (`vfs.fs.inode[{#FSNAME},used]`)  
  Used inodes on the filesystem.
* Free disk space on $1 (`vfs.fs.size[{#FSNAME},free]`)  
  Free disk space in bytes on the filesystem.
* Free disk space on $1 in % (`vfs.fs.size[{#FSNAME},pfree]`)  
  Free disk space in percent on the filesystem.
* Used disk space on $1 in % (`vfs.fs.size[{#FSNAME},pused]`)  
  Used disk space in percent on the filesystem.
* Total disk space on $1 (`vfs.fs.size[{#FSNAME},total]`)  
  Total disk space in bytes of the filesystem.
* Used disk space on $1 (`vfs.fs.size[{#FSNAME},used]`)  
  Used disk space in bytes on the filesystem.
##### Trigger Prototypes
* Warning: Free disk space on {HOST.NAME}:{#FSNAME} is low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template OS FreeBSD active:vfs.fs.size[{#FSNAME},free].last(0)}
    < {$OS_FREEBSD_FS_FREE_WARNING_THRESHOLD:"{#FSNAME}"}
  
  and
  
  {Template OS FreeBSD active:vfs.fs.size[{#FSNAME},pfree].last()}
    < {$OS_FREEBSD_FS_PFREE_WARNING_THRESHOLD:"{#FSNAME}"}
  ```
  The free disk space on the filesystem is below `{$OS_FREEBSD_FS_FREE_WARNING_THRESHOLD:"{#FSNAME}"}` and `{$OS_FREEBSD_FS_PFREE_WARNING_THRESHOLD:"{#FSNAME}"}` percent.
* High: Free disk space on {HOST.NAME}:{#FSNAME} is very low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template OS FreeBSD active:vfs.fs.size[{#FSNAME},free].last(0)}
    < {$OS_FREEBSD_FS_FREE_HIGH_THRESHOLD:"{#FSNAME}"}
  
  and
  
  {Template OS FreeBSD active:vfs.fs.size[{#FSNAME},pfree].last()}
    < {$OS_FREEBSD_FS_PFREE_HIGH_THRESHOLD:"{#FSNAME}"}
  ```
  The free disk space on the filesystem is below `{$OS_FREEBSD_FS_FREE_HIGH_THRESHOLD:"{#FSNAME}"}` and {$OS_FREEBSD_FS_PFREE_HIGH_THRESHOLD:"{#FSNAME}"}` percent.
* Warning: Free inodes on {HOST.NAME}:{#FSNAME} are low ({ITEM.VALUE1} < $2 % )
  ```
  {Template OS FreeBSD active:vfs.fs.inode[{#FSNAME},pfree].last(0)} < {$OS_FREEBSD_INODE_PFREE_WARNING_THRESHOLD:"{#FSNAME}"}
  ```
  The free inodes on the filesystem are below `{$OS_FREEBSD_INODE_PFREE_WARNING_THRESHOLD:"{#FSNAME}"}`
* High: Free inodes on {HOST.NAME}:{#FSNAME} are very low ({ITEM.VALUE1} < $2 % )
  ```
  {Template OS FreeBSD active:vfs.fs.inode[{#FSNAME},pfree].last(0)} < {$OS_FREEBSD_INODE_PFREE_HIGH_THRESHOLD:"{#FSNAME}"}
  ```
  The free inodes on the filesystem are below `{$OS_FREEBSD_INODE_PFREE_HIGH_THRESHOLD:"{#FSNAME}"}`
### Triggers
* Warning: /etc/passwd has been changed on {HOST.NAME}
  ```
  {Template OS FreeBSD active:vfs.file.cksum[/etc/passwd].diff(0)}>0
  ```
  The `/etc/passwd` has been changed. This could be an indication that someone is trying to tamper with the system or, most likely, just a normal consequence after a user account creation or modification.
* Warning: Available memory on {HOST.NAME} is low (< $2 %, {ITEM.VALUE1} available)
  ```
  {Template OS FreeBSD active:vm.memory.size[available].last(0)}
    < {$OS_FREEBSD_MEMORY_AVAILABLE_WARNING_THRESHOLD}
  and
  {Template OS FreeBSD active:vm.memory.size[pavailable].last()}
    < {$OS_FREEBSD_MEMORY_PAVAILABLE_WARNING_THRESHOLD}
  ```
  The available memory on the system is below `{$OS_FREEBSD_MEMORY_AVAILABLE_WARNING_THRESHOLD}` and `{$OS_FREEBSD_MEMORY_PAVAILABLE_WARNING_THRESHOLD}` percent.
* High: Available memory on {HOST.NAME} is very low (< $2 %, {ITEM.VALUE1} bytes available)
  ```
  {Template OS FreeBSD active:vm.memory.size[available].last(0)}
    < {$OS_FREEBSD_MEMORY_AVAILABLE_HIGH_THRESHOLD}
  and
  {Template OS FreeBSD active:vm.memory.size[pavailable].last()}
    < {$OS_FREEBSD_MEMORY_PAVAILABLE_HIGH_THRESHOLD}
  ```
  The available memory on the system is below `{$OS_FREEBSD_MEMORY_AVAILABLE_HIGH_THRESHOLD}` and `{$OS_FREEBSD_MEMORY_PAVAILABLE_HIGH_THRESHOLD}` percent.
* Warning: Available swap space on {HOST.NAME} is low (< $2 %, {ITEM.VALUE1} available)
  ```
  {Template OS FreeBSD active:system.swap.size[,free].last()}
    < {$OS_FREEBSD_SWAP_FREE_WARNING_THRESHOLD}
  
  and
  
  {Template OS FreeBSD active:system.swap.size[,pfree].last()}
    < {$OS_FREEBSD_SWAP_PFREE_WARNING_THRESHOLD}
  ```
  The available swap space on the system is below `{$OS_FREEBSD_SWAP_FREE_WARNING_THRESHOLD}` and `{$OS_FREEBSD_SWAP_PFREE_WARNING_THRESHOLD}` percent.
* High: Available swap space on {HOST.NAME} is very low (< $2 %, {ITEM.VALUE1} available)
  ```
  {Template OS FreeBSD active:system.swap.size[,free].last()}
    < {$OS_FREEBSD_SWAP_FREE_HIGH_THRESHOLD}
  
  and
  
  {Template OS FreeBSD active:system.swap.size[,pfree].last()}
    < {$OS_FREEBSD_SWAP_PFREE_HIGH_THRESHOLD}
  ```
  The available swap space on the system is below `{$OS_FREEBSD_SWAP_FREE_HIGH_THRESHOLD}` and `{$OS_FREEBSD_SWAP_PFREE_HIGH_THRESHOLD}` percent.
* Warning: CPU utilization is high (< $1 % idle over {$OS_FREEBSD_CPU_IDLE_WARNING_TIME}) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.cpu.util[,idle,avg5].avg({$OS_FREEBSD_CPU_IDLE_WARNING_TIME})}<{$OS_FREEBSD_CPU_IDLE_WARNING_THRESHOLD}
  ```
  The CPU is below `{$OS_FREEBSD_CPU_IDLE_WARNING_THRESHOLD}` percent idle over `{$OS_FREEBSD_CPU_IDLE_WARNING_TIME}`.
* High: CPU utilization is very high (< $1 % idle over {$OS_FREEBSD_CPU_IDLE_HIGH_TIME}) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.cpu.util[,idle,avg5].avg({$OS_FREEBSD_CPU_IDLE_HIGH_TIME})}<{$OS_FREEBSD_CPU_IDLE_HIGH_THRESHOLD}
  ```
  The CPU is below `{$OS_FREEBSD_CPU_IDLE_HIGH_THRESHOLD}` percent idle over `{$OS_FREEBSD_CPU_IDLE_HIGH_TIME}`.
* Information: Host information was changed on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.uname.diff(0)}>0
  ```
  The host's uname has changed.
* Information: Hostname was changed on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.hostname.diff(0)}>0
  ```
  The system's hostname was changed.
* Warning: Many processes ({ITEM.VALUE} > $1) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:proc.num[].last(0)}>{$OS_FREEBSD_PROC_NUM_WARNING_THRESHOLD}
  ```
  There are more than `{$OS_FREEBSD_PROC_NUM_WARNING_THRESHOLD}` number of processes on the system.
* Warning: Processor load is high (> $1 over {$OS_FREEBSD_CPU_LOAD_WARNING_TIME}) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.cpu.load[percpu,avg1].avg({$OS_FREEBSD_CPU_LOAD_WARNING_TIME})}>{$OS_FREEBSD_CPU_LOAD_WARNING_THRESHOLD}
  ```
  The 1 minute average per core CPU load is over `{$OS_FREEBSD_CPU_LOAD_WARNING_THRESHOLD}` for the last `{$OS_FREEBSD_CPU_LOAD_WARNING_TIME}`
* High: Processor load is very high (> $1 over {$OS_FREEBSD_CPU_LOAD_HIGH_TIME}) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.cpu.load[percpu,avg1].avg({$OS_FREEBSD_CPU_LOAD_HIGH_TIME})}>{$OS_FREEBSD_CPU_LOAD_HIGH_THRESHOLD}
  ```
  The 1 minute average per core CPU load is over `{$OS_FREEBSD_CPU_LOAD_HIGH_THRESHOLD}` for the last `{$OS_FREEBSD_CPU_LOAD_HIGH_TIME}`
* Warning: Time is drifting away on {HOST.NAME}
  ```
  {Template OS FreeBSD active:system.localtime.fuzzytime({$OS_FREEBSD_TIME_DRIFT_WARNING_THRESHOLD})}=0
  ```
  The system's local time differs for more than `{$OS_FREEBSD_TIME_DRIFT_WARNING_THRESHOLD}` seconds from the Zabbix server.
* High: Too many processes ({ITEM.VALUE} > $1) on {HOST.NAME}
  ```
  {Template OS FreeBSD active:proc.num[].last(0)}>{$OS_FREEBSD_PROC_NUM_HIGH_THRESHOLD}
  ```
  There are more than `{$OS_FREEBSD_PROC_NUM_HIGH_THRESHOLD}` number of processes on the system.
* Information: {HOST.NAME} has just been restarted (uptime {ITEM.VALUE1})
  ```
  {Template OS FreeBSD active:system.uptime.last(0)}<600
  ```
  The system's uptime is lower than 10 minutes, which indicates a recent start or reboot of the system.
* Information: {ITEM.VALUE} unsupported items on {HOST.NAME}
  ```
  {Template OS FreeBSD active:zabbix[host,,items_unsupported].last()}>0
  ```
  The host has unsupported items, which might be an indication of a problem with certain items. Disable or fix the items.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
