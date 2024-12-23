# Compare Rabe Override with Upstream Template

Original: [Windows by Zabbix agent active](https://raw.githubusercontent.com/zabbix/zabbix/release/7.0/templates/os/windows_agent_active/template_os_windows_agent_active.yaml)

## Diff

```diff
--- before
+++ after
@@ -24,6 +24,7 @@
           type: ZABBIX_ACTIVE
           key: agent.hostname
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           preprocessing:
@@ -37,6 +38,7 @@
           name: 'Zabbix agent ping'
           type: ZABBIX_ACTIVE
           key: agent.ping
+          history: 7d
           description: 'The agent always returns "1" for this item. May be used in combination with `nodata()` for the availability check.'
           valuemap:
             name: 'Zabbix agent ping status'
@@ -59,6 +61,7 @@
           type: ZABBIX_ACTIVE
           key: agent.version
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           preprocessing:
@@ -72,6 +75,7 @@
           name: 'Cache bytes'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Memory\Cache Bytes"]'
+          history: 7d
           units: B
           description: 'Cache Bytes is the sum of the Memory\\System Cache Resident Bytes, Memory\\System Driver Resident Bytes, Memory\\System Code Resident Bytes, and Memory\\Pool Paged Resident Bytes counters. This counter displays the last observed value only; it is not an average.'
           tags:
@@ -81,6 +85,7 @@
           name: 'Free system page table entries'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Memory\Free System Page Table Entries"]'
+          history: 7d
           description: 'This indicates the number of page table entries not currently in use by the system. If the number is less than 5,000, there may be a memory leak or you running out of memory.'
           tags:
             - tag: component
@@ -102,6 +107,7 @@
           name: 'Memory page faults per second'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Memory\Page Faults/sec"]'
+          history: 7d
           value_type: FLOAT
           description: 'Page Faults/sec is the average number of pages faulted per second. It is measured in number of pages faulted per second because only one page is faulted in each fault operation, hence this is also equal to the number of page fault operations. This counter includes both hard faults (those that require disk access) and soft faults (where the faulted page is found elsewhere in physical memory.) Most processors can handle large numbers of soft faults without significant consequence. However, hard faults, which require disk access, can cause significant delays.'
           tags:
@@ -111,6 +117,7 @@
           name: 'Memory pages per second'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Memory\Pages/sec"]'
+          history: 7d
           value_type: FLOAT
           description: |
             This measures the rate at which pages are read from or written to disk to resolve hard page faults.
@@ -135,6 +142,7 @@
           name: 'Memory pool non-paged'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Memory\Pool Nonpaged Bytes"]'
+          history: 7d
           units: B
           description: |
             This measures the size, in bytes, of the non-paged pool. This is an area of system memory for objects that cannot be written to disk but instead must remain in physical memory as long as they are allocated.
@@ -146,6 +154,7 @@
           name: 'Used swap space in %'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Paging file(_Total)\% Usage"]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The used space of swap volume/file in percent.'
@@ -158,6 +167,7 @@
           name: 'CPU DPC time'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Processor Information(_total)\% DPC Time"]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'Processor DPC time is the time that a single processor spent receiving and servicing deferred procedure calls (DPCs). DPCs are interrupts that run at a lower priority than standard interrupts. `% DPC Time` is a component of `% Privileged Time` because DPCs are executed in privileged mode. If a high `% DPC Time` is sustained, there may be a processor bottleneck or an application or hardware related issue that can significantly diminish overall system performance.'
@@ -168,6 +178,7 @@
           name: 'CPU interrupt time'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Processor Information(_total)\% Interrupt Time"]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The processor information `% Interrupt Time` counter indicates how much time the processor spends handling hardware interrupts during sample intervals. It reflects the activity of devices like the system clock, mouse, disk drivers, and network cards. A value above 20% suggests possible hardware issues.'
@@ -191,6 +202,7 @@
           name: 'CPU privileged time'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Processor Information(_total)\% Privileged Time"]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The processor information `% Privileged Time` counter shows the percent of time that the processor is spent executing in Kernel (or Privileged) mode. Privileged mode includes services interrupts inside Interrupt Service Routines (ISRs), executing Deferred Procedure Calls (DPCs), Device Driver calls and other kernel-mode functions of the Windows Operating System.'
@@ -216,6 +228,7 @@
           name: 'CPU user time'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\Processor Information(_total)\% User Time"]'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The processor information `% User Time` counter shows the percent of time that the processor(s) is spent executing in User mode.'
@@ -226,6 +239,7 @@
           name: 'Context switches per second'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\System\Context Switches/sec"]'
+          history: 7d
           value_type: FLOAT
           description: |
             Context Switches/sec is the combined rate at which all processors on the computer are switched from one thread to another.
@@ -239,6 +253,7 @@
           name: 'CPU queue length'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\System\Processor Queue Length"]'
+          history: 7d
           value_type: FLOAT
           description: 'The Processor Queue Length shows the number of threads that are observed as delayed in the processor Ready Queue and are waiting to be executed.'
           tags:
@@ -248,6 +263,7 @@
           name: 'Number of threads'
           type: ZABBIX_ACTIVE
           key: 'perf_counter_en["\System\Threads"]'
+          history: 7d
           description: 'The number of threads used by all running processes.'
           tags:
             - tag: component
@@ -256,6 +272,7 @@
           name: 'Number of processes'
           type: ZABBIX_ACTIVE
           key: 'proc.num[]'
+          history: 7d
           description: 'The number of processes.'
           tags:
             - tag: component
@@ -264,6 +281,7 @@
           name: 'CPU utilization'
           type: ZABBIX_ACTIVE
           key: system.cpu.util
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'CPU utilization expressed in %.'
@@ -286,6 +304,7 @@
           type: ZABBIX_ACTIVE
           key: system.hostname
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'The host name of the system.'
@@ -312,6 +331,7 @@
           name: 'System local time'
           type: ZABBIX_ACTIVE
           key: system.localtime
+          history: 7d
           units: unixtime
           description: 'The local system time of the host.'
           tags:
@@ -322,6 +342,7 @@
           type: ZABBIX_ACTIVE
           key: system.sw.arch
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'The architecture of the operating system.'
@@ -337,6 +358,7 @@
           type: ZABBIX_ACTIVE
           key: system.sw.os
           delay: 1h
+          history: 7d
           value_type: CHAR
           trends: '0'
           inventory_link: OS
@@ -364,6 +386,7 @@
           name: 'Free swap space'
           type: CALCULATED
           key: system.swap.free
+          history: 7d
           units: B
           params: 'last(//system.swap.size[,total]) - last(//system.swap.size[,total]) / 100 * last(//perf_counter_en["\Paging file(_Total)\% Usage"])'
           description: 'The free space of the swap volume/file expressed in bytes.'
@@ -377,6 +400,7 @@
           type: DEPENDENT
           key: system.swap.pfree
           delay: '0'
+          history: 7d
           value_type: FLOAT
           units: '%'
           description: 'The free space of the swap volume/file expressed in %.'
@@ -395,6 +419,7 @@
           name: 'Total swap space'
           type: ZABBIX_ACTIVE
           key: 'system.swap.size[,total]'
+          history: 7d
           units: B
           description: 'The total space of the swap volume/file expressed in bytes.'
           tags:
@@ -407,6 +432,7 @@
           type: ZABBIX_ACTIVE
           key: system.uname
           delay: 15m
+          history: 7d
           value_type: CHAR
           trends: '0'
           description: 'System description of the host.'
@@ -422,6 +448,7 @@
           type: ZABBIX_ACTIVE
           key: system.uptime
           delay: 30s
+          history: 7d
           trends: '0'
           units: uptime
           description: 'The system uptime expressed in the following format: "N days, hh:mm:ss".'
@@ -454,6 +481,7 @@
           name: 'Total memory'
           type: ZABBIX_ACTIVE
           key: 'vm.memory.size[total]'
+          history: 7d
           units: B
           description: 'Total memory expressed in bytes.'
           tags:
@@ -463,6 +491,7 @@
           name: 'Used memory'
           type: ZABBIX_ACTIVE
           key: 'vm.memory.size[used]'
+          history: 7d
           units: B
           description: 'Used memory in bytes.'
           tags:
@@ -472,6 +501,7 @@
           name: 'Memory utilization'
           type: CALCULATED
           key: vm.memory.util
+          history: 7d
           value_type: FLOAT
           units: '%'
           params: 'last(//vm.memory.size[used]) / last(//vm.memory.size[total]) * 100'
@@ -510,6 +540,7 @@
           name: 'Number of cores'
           type: ZABBIX_ACTIVE
           key: 'wmi.get[root/cimv2,"Select NumberOfLogicalProcessors from Win32_ComputerSystem"]'
+          history: 7d
           description: 'The number of logical processors available on the computer.'
           tags:
             - tag: component
@@ -518,6 +549,7 @@
           name: 'Active agent availability'
           type: INTERNAL
           key: 'zabbix[host,active_agent,available]'
+          history: 7d
           description: |
             Availability of active checks on the host. The value of this item corresponds to availability icons in the host list.
             Possible values:
@@ -1782,6 +1814,15 @@
               newvalue: available
             - value: '2'
               newvalue: 'not available'
+        - uuid: 9c0c0eb0ed7e495b9d4d487df7af0acd
+          name: zabbix.host.available
+          mappings:
+            - value: '0'
+              newvalue: 'not available'
+            - value: '1'
+              newvalue: available
+            - value: '2'
+              newvalue: unknown
         - uuid: 0b50ea7e6695421da023ece0a23bed10
           name: 'Zabbix agent ping status'
           mappings:


```
