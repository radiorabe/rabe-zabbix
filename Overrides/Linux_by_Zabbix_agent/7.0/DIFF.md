# Compare Rabe Override with Upstream Template

Original: [Linux by Zabbix agent](https://raw.githubusercontent.com/zabbix/zabbix/refs/heads/release/7.0/templates/os/linux/template_os_linux.yaml)

## Diff

```diff
--- before
+++ after
@@ -30,6 +30,7 @@
           name: 'Host name of Zabbix agent running'
           key: agent.hostname
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           preprocessing:
@@ -42,6 +43,7 @@
         - uuid: f94f9f4699e94c369e6c98b2a2f485ce
           name: 'Zabbix agent ping'
           key: agent.ping
+          history: 7d
           description: 'The agent always returns "1" for this item. May be used in combination with `nodata()` for the availability check.'
           valuemap:
             name: 'Zabbix agent ping status'
@@ -52,6 +54,7 @@
           name: 'Version of Zabbix agent running'
           key: agent.version
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           preprocessing:
@@ -65,6 +68,7 @@
           name: 'Maximum number of open file descriptors'
           key: kernel.maxfiles
           delay: 1h
+          history: 7d
           description: 'May be increased by using the `sysctl` utility or modifying the file `/etc/sysctl.conf`.'
           preprocessing:
             - type: DISCARD_UNCHANGED_HEARTBEAT
@@ -86,6 +90,7 @@
           name: 'Maximum number of processes'
           key: kernel.maxproc
           delay: 1h
+          history: 7d
           description: 'May be increased by using the `sysctl` utility or modifying the file `/etc/sysctl.conf`.'
           preprocessing:
             - type: DISCARD_UNCHANGED_HEARTBEAT
@@ -109,12 +114,14 @@
         - uuid: ab7d0471092544a6a950184d1bac906d
           name: 'Number of processes'
           key: proc.num
+          history: 7d
           tags:
             - tag: component
               value: system
         - uuid: b2637293884d40108f41b11767dd5be0
           name: 'Number of running processes'
           key: 'proc.num[,,run]'
+          history: 7d
           tags:
             - tag: component
               value: system
@@ -122,6 +129,7 @@
           name: 'System boot time'
           key: system.boottime
           delay: 15m
+          history: 7d
           units: unixtime
           preprocessing:
             - type: DISCARD_UNCHANGED_HEARTBEAT
@@ -133,6 +141,7 @@
         - uuid: 5d186a46867b4eaaafd6396d3239dd3b
           name: 'Interrupts per second'
           key: system.cpu.intr
+          history: 7d
           value_type: FLOAT
           description: 'Number of interrupts processed.'
           preprocessing:
@@ -145,6 +154,7 @@
         - uuid: 48528aa936a04c8189375a6eae4033da
           name: 'Load average (1m avg)'
           key: 'system.cpu.load[all,avg1]'
+          history: 7d
           value_type: FLOAT
           description: 'Calculated as the system CPU load divided by the number of CPU cores.'
           tags:
@@ -153,6 +163,7 @@
         - uuid: 953beb580df8418cb88b667b9dd37259
           name: 'Load average (5m avg)'
           key: 'system.cpu.load[all,avg5]'
+          history: 7d
           value_type: FLOAT
           description: 'Calculated as the system CPU load divided by the number of CPU cores.'
           tags:
@@ -161,6 +172,7 @@
         - uuid: 5716000e38e24dae8ead4ed98ede024b
           name: 'Load average (15m avg)'
           key: 'system.cpu.load[all,avg15]'
+          history: 7d
           value_type: FLOAT
           description: 'Calculated as the system CPU load divided by the number of CPU cores.'
           tags:
@@ -169,6 +181,7 @@
         - uuid: f72e115544eb4079b09fec8c3539241c
           name: 'Number of CPUs'
           key: system.cpu.num
+          history: 7d
           preprocessing:
             - type: DISCARD_UNCHANGED_HEARTBEAT
               parameters:
@@ -179,6 +192,7 @@
         - uuid: 73e85aa10a704fc7950d2d077f0c54ee
           name: 'Context switches per second'
           key: system.cpu.switches
+          history: 7d
           value_type: FLOAT
           description: 'The combined rate at which all processors on the computer are switched from one thread to another.'
           preprocessing:
@@ -193,6 +207,7 @@
           type: DEPENDENT
           key: system.cpu.util
           delay: '0'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'CPU utilization expressed in %.'
@@ -225,6 +240,7 @@
         - uuid: 69b187838fb74f319e47c2ff4f99ef54
           name: 'CPU guest time'
           key: 'system.cpu.util[,guest]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time spent on running a virtual CPU for a guest operating system.'
@@ -234,6 +250,7 @@
         - uuid: a2b07497f2f343a99d26ad77e65bb54f
           name: 'CPU guest nice time'
           key: 'system.cpu.util[,guest_nice]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time spent on running a niced guest (a virtual CPU for guest operating systems under the control of the Linux kernel).'
@@ -243,6 +260,7 @@
         - uuid: 7aad6d159baa4a24901847144f0d231b
           name: 'CPU idle time'
           key: 'system.cpu.util[,idle]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has spent doing nothing.'
@@ -252,6 +270,7 @@
         - uuid: cc4bc7693ae84f9bb18cee38d0814195
           name: 'CPU interrupt time'
           key: 'system.cpu.util[,interrupt]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has spent servicing hardware interrupts.'
@@ -261,6 +280,7 @@
         - uuid: 5df67d9162cc437585990cc8708be894
           name: 'CPU iowait time'
           key: 'system.cpu.util[,iowait]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has been waiting for I/O to complete.'
@@ -270,6 +290,7 @@
         - uuid: 8ee6e54c86ba44ab88bb9e83c632c1ed
           name: 'CPU nice time'
           key: 'system.cpu.util[,nice]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has spent running users'' processes that have been niced.'
@@ -279,6 +300,7 @@
         - uuid: a949a36004a449c58bef0cdc9d3fafd6
           name: 'CPU softirq time'
           key: 'system.cpu.util[,softirq]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has been servicing software interrupts.'
@@ -288,6 +310,7 @@
         - uuid: 3161dbd18e874e69b729c8e903cf7390
           name: 'CPU steal time'
           key: 'system.cpu.util[,steal]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The amount of "stolen" CPU from this virtual machine by the hypervisor for other tasks, such as running another virtual machine.'
@@ -297,6 +320,7 @@
         - uuid: d93097ed5ce74d35b6041ef2b5ba18e8
           name: 'CPU system time'
           key: 'system.cpu.util[,system]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has spent running the kernel and its processes.'
@@ -306,6 +330,7 @@
         - uuid: 57f9e2e34fab41e18e2bc93e786c92c6
           name: 'CPU user time'
           key: 'system.cpu.util[,user]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Time the CPU has spent running users'' processes that are not niced.'
@@ -316,6 +341,7 @@
           name: 'System name'
           key: system.hostname
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'The host name of the system.'
@@ -343,6 +369,7 @@
         - uuid: 6072902361404672a444841c786875e6
           name: 'System local time'
           key: system.localtime
+          history: 7d
           units: unixtime
           description: 'The local system time of the host.'
           tags:
@@ -367,6 +394,7 @@
           name: 'Operating system architecture'
           key: system.sw.arch
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'The architecture of the operating system.'
@@ -381,6 +409,7 @@
           name: 'Operating system'
           key: system.sw.os
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           inventory_link: OS
@@ -408,6 +437,7 @@
           name: 'Number of installed packages'
           key: system.sw.packages.get
           delay: 1h
+          history: 7d
           preprocessing:
             - type: JSONPATH
               parameters:
@@ -430,6 +460,7 @@
         - uuid: 160b82c121b147cbbf18c34dbb01d3ce
           name: 'Free swap space'
           key: 'system.swap.size[,free]'
+          history: 7d
           units: B
           description: 'The free space of the swap volume/file expressed in bytes.'
           tags:
@@ -440,6 +471,7 @@
         - uuid: ca423242172f4b20ba47c26f4a61aee7
           name: 'Free swap space in %'
           key: 'system.swap.size[,pfree]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The free space of the swap volume/file expressed in %.'
@@ -451,6 +483,7 @@
         - uuid: 102c81b5523c4be0b4beae3cb88ebde1
           name: 'Total swap space'
           key: 'system.swap.size[,total]'
+          history: 7d
           units: B
           description: 'The total space of the swap volume/file expressed in bytes.'
           tags:
@@ -462,6 +495,7 @@
           name: 'System description'
           key: system.uname
           delay: 15m
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'The information as normally returned by `uname -a`.'
@@ -476,6 +510,7 @@
           name: 'System uptime'
           key: system.uptime
           delay: 30s
+          history: 7d
           trends: '0'
           units: uptime
           description: 'The system uptime expressed in the following format: "N days, hh:mm:ss".'
@@ -496,6 +531,7 @@
         - uuid: 88056b3d2e424d5aba7cabcd4b043c9e
           name: 'Number of logged in users'
           key: system.users.num
+          history: 7d
           description: 'The number of users who are currently logged in.'
           tags:
             - tag: component
@@ -504,6 +540,7 @@
           name: 'Checksum of /etc/passwd'
           key: 'vfs.file.cksum[/etc/passwd,sha256]'
           delay: 15m
+          history: 7d
           value_type: CHAR
           trends: '0'
           preprocessing:
@@ -540,6 +577,7 @@
         - uuid: e811e6e2ae84461294e121f12e767b40
           name: 'Available memory'
           key: 'vm.memory.size[available]'
+          history: 7d
           units: B
           description: |
             The available memory:
@@ -553,6 +591,7 @@
         - uuid: 20779a4c43374e5f9bea2584e93b85ef
           name: 'Available memory in %'
           key: 'vm.memory.size[pavailable]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The available memory as percentage of the total. See also Appendixes in Zabbix Documentation about parameters of the `vm.memory.size` item.'
@@ -562,6 +601,7 @@
         - uuid: d5c3541a7c0949ce812df1beb0732941
           name: 'Total memory'
           key: 'vm.memory.size[total]'
+          history: 7d
           units: B
           description: 'Total memory expressed in bytes.'
           tags:
@@ -572,6 +612,7 @@
           type: DEPENDENT
           key: vm.memory.utilization
           delay: '0'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The percentage of used memory is calculated as `100-pavailable`.'
@@ -603,6 +644,7 @@
           name: 'Zabbix agent availability'
           type: INTERNAL
           key: 'zabbix[host,agent,available]'
+          history: 7d
           description: 'Used for monitoring the availability status of the agent.'
           valuemap:
             name: zabbix.host.available
@@ -641,6 +683,7 @@
               name: 'Interface {#IFNAME}: Inbound packets discarded'
               key: 'net.if.in["{#IFNAME}",dropped]'
               delay: 3m
+              history: 7d
               preprocessing:
                 - type: CHANGE_PER_SECOND
                   parameters:
@@ -654,6 +697,7 @@
               name: 'Interface {#IFNAME}: Inbound packets with errors'
               key: 'net.if.in["{#IFNAME}",errors]'
               delay: 3m
+              history: 7d
               preprocessing:
                 - type: CHANGE_PER_SECOND
                   parameters:
@@ -667,6 +711,7 @@
               name: 'Interface {#IFNAME}: Bits received'
               key: 'net.if.in["{#IFNAME}"]'
               delay: 3m
+              history: 7d
               units: bps
               preprocessing:
                 - type: CHANGE_PER_SECOND
@@ -684,6 +729,7 @@
               name: 'Interface {#IFNAME}: Outbound packets discarded'
               key: 'net.if.out["{#IFNAME}",dropped]'
               delay: 3m
+              history: 7d
               preprocessing:
                 - type: CHANGE_PER_SECOND
                   parameters:
@@ -697,6 +743,7 @@
               name: 'Interface {#IFNAME}: Outbound packets with errors'
               key: 'net.if.out["{#IFNAME}",errors]'
               delay: 3m
+              history: 7d
               preprocessing:
                 - type: CHANGE_PER_SECOND
                   parameters:
@@ -710,6 +757,7 @@
               name: 'Interface {#IFNAME}: Bits sent'
               key: 'net.if.out["{#IFNAME}"]'
               delay: 3m
+              history: 7d
               units: bps
               preprocessing:
                 - type: CHANGE_PER_SECOND
@@ -726,6 +774,7 @@
             - uuid: 3efd24ad36b04eb995cfeab82721c2fe
               name: 'Interface {#IFNAME}: Operational status'
               key: 'vfs.file.contents["/sys/class/net/{#IFNAME}/operstate"]'
+              history: 7d
               trends: '0'
               description: 'Reference: https://www.kernel.org/doc/Documentation/networking/operstates.txt'
               valuemap:
@@ -788,6 +837,7 @@
               name: 'Interface {#IFNAME}: Speed'
               key: 'vfs.file.contents["/sys/class/net/{#IFNAME}/speed"]'
               delay: 5m
+              history: 7d
               trends: '0'
               units: bps
               description: |
@@ -811,6 +861,7 @@
               name: 'Interface {#IFNAME}: Interface type'
               key: 'vfs.file.contents["/sys/class/net/{#IFNAME}/type"]'
               delay: 1h
+              history: 7d
               trends: '0'
               description: |
                 It indicates the interface protocol type as a decimal value.
@@ -958,6 +1009,7 @@
               type: DEPENDENT
               key: 'vfs.dev.queue_size[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               description: 'The current average disk queue; the number of requests outstanding on the disk while the performance data is being collected.'
               preprocessing:
@@ -981,6 +1033,7 @@
               name: '{#DEVNAME}: Disk read request avg waiting time (r_await)'
               type: CALCULATED
               key: 'vfs.dev.read.await[{#DEVNAME}]'
+              history: 7d
               value_type: FLOAT
               units: '!ms'
               params: '(last(//vfs.dev.read.time.rate[{#DEVNAME}])/(last(//vfs.dev.read.rate[{#DEVNAME}])+(last(//vfs.dev.read.rate[{#DEVNAME}])=0)))*1000*(last(//vfs.dev.read.rate[{#DEVNAME}]) > 0)'
@@ -995,6 +1048,7 @@
               type: DEPENDENT
               key: 'vfs.dev.read.rate[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               units: '!r/s'
               description: 'r/s (read operations per second) - the number (after merges) of read requests completed per second for the device.'
@@ -1017,6 +1071,7 @@
               type: DEPENDENT
               key: 'vfs.dev.read.time.rate[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               description: 'The rate of total read time counter; used in `r_await` calculation.'
               preprocessing:
@@ -1041,6 +1096,7 @@
               type: DEPENDENT
               key: 'vfs.dev.util[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               units: '%'
               description: 'The percentage of elapsed time during which the selected disk drive was busy while servicing read or write requests.'
@@ -1065,6 +1121,7 @@
               name: '{#DEVNAME}: Disk write request avg waiting time (w_await)'
               type: CALCULATED
               key: 'vfs.dev.write.await[{#DEVNAME}]'
+              history: 7d
               value_type: FLOAT
               units: '!ms'
               params: '(last(//vfs.dev.write.time.rate[{#DEVNAME}])/(last(//vfs.dev.write.rate[{#DEVNAME}])+(last(//vfs.dev.write.rate[{#DEVNAME}])=0)))*1000*(last(//vfs.dev.write.rate[{#DEVNAME}]) > 0)'
@@ -1079,6 +1136,7 @@
               type: DEPENDENT
               key: 'vfs.dev.write.rate[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               units: '!w/s'
               description: 'w/s (write operations per second) - the number (after merges) of write requests completed per second for the device.'
@@ -1101,6 +1159,7 @@
               type: DEPENDENT
               key: 'vfs.dev.write.time.rate[{#DEVNAME}]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               description: 'The rate of total write time counter; used in `w_await` calculation.'
               preprocessing:
@@ -1215,6 +1274,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent.inode[{#FSNAME},pfree]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               units: '%'
               description: 'Free metadata space expressed in %.'
@@ -1264,6 +1324,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent.size[{#FSNAME},free]'
               delay: '0'
+              history: 7d
               units: B
               description: 'Available storage space expressed in bytes.'
               preprocessing:
@@ -1284,6 +1345,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent.size[{#FSNAME},pused]'
               delay: '0'
+              history: 7d
               value_type: FLOAT
               units: '%'
               description: 'Calculated as the percentage of currently used space compared to the maximum available space.'
@@ -1341,6 +1403,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent.size[{#FSNAME},total]'
               delay: '0'
+              history: 7d
               units: B
               description: 'Total space expressed in bytes.'
               preprocessing:
@@ -1361,6 +1424,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent.size[{#FSNAME},used]'
               delay: '0'
+              history: 7d
               units: B
               description: 'Used storage expressed in bytes.'
               preprocessing:
@@ -1405,6 +1469,7 @@
               type: DEPENDENT
               key: 'vfs.fs.dependent[{#FSNAME},readonly]'
               delay: '0'
+              history: 7d
               description: 'The filesystem is mounted as read-only. It is available only for Zabbix agents 6.4 and higher.'
               preprocessing:
                 - type: JSONPATH


```
