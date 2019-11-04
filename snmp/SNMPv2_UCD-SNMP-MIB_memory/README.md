# Zabbix SNMPv2 UCD-SNMP-MIB memory monitoring
Monitors memory and swap parameters exposed by the
[`UCD-SNMP-MIB`](http://www.net-snmp.org/docs/mibs/UCD-SNMP-MIB.txt)
(University of California, Davis MIB) via SNMPv2

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage
1. Download the
   [`UCD-SNMP-MIB`](http://www.net-snmp.org/docs/mibs/UCD-SNMP-MIB.txt) (if not
   already available on your system)
2. Place the MIB file(s) into your default MIB directory on the Zabbix server
   and/or proxy (usually `/usr/local/share/snmp/mibs`) and make sure that the
   Zabbix server and/or proxy loads them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
3. Import the
   [`Template_SNMPv2_UCD-SNMP-MIB_memory.xml`](Template_SNMPv2_UCD-SNMP-MIB_memory.xml)
   into your Zabbix server (click on the `Raw` button to download).
4. Add an SNMP interface configuration to your host
5. Set the `{$SNMP_COMMUNITY}` macro to your desired community if you don't use
   `public`
6. Add the template to your host (or stack template)
7. Check if new data arrives

## Notes
### snmpwalk command
The following `snmpwalk` command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> UCD-SNMP-MIB::memory
```
## Template SNMPv2 UCD-SNMP-MIB memory
SNMPv2 template for monitoring the memory usage of a host exposing the [`UCD-SNMP-MIB`](http://www.net-snmp.org/docs/mibs/ucdavis.html) (University of California, Davis MIB) `memory` table.
### Items
* Available memory (`rabe.snmp.ucd-snmp-mib.memAvailReal[]`)  
  The amount of real/physical memory currently unused or available.
* Available swap space (`rabe.snmp.ucd-snmp-mib.memAvailSwap[]`)  
  The amount of swap space currently unused or available.
* Buffered memory (`rabe.snmp.ucd-snmp-mib.memBuffer[]`)  
  The total amount of real or virtual memory currently allocated for use as memory buffers.

This object will not be implemented on hosts where the underlying operating system does not explicitly identify memory as specifically reserved for this purpose.
* Cached memory (`rabe.snmp.ucd-snmp-mib.memCached[]`)  
  The total amount of real or virtual memory currently allocated for use as cached memory.

This object will not be implemented on hosts where the underlying operating system does not explicitly identify memory as specifically reserved for this purpose."
* Minimum swap expected to be free (`rabe.snmp.ucd-snmp-mib.memMinimumSwap[]`)  
  The minimum amount of swap space expected to be kept free or available during normal operation of this host.
* Available memory in percent (`rabe.snmp.ucd-snmp-mib.memPercentAvailReal[]`)  
  The amount of real/physical memory currently unused or available in percent.
* Available swap in percent (`rabe.snmp.ucd-snmp-mib.memPercentAvailSwap[]`)  
  The amount of swap space currently unused or available in percent.
* Shared memory (`rabe.snmp.ucd-snmp-mib.memShared[]`)  
  The total amount of real or virtual memory currently allocated for use as shared memory.

This object will not be implemented on hosts where the underlying operating system does not explicitly identify memory as specifically reserved for this purpose.
* Swap error message (`rabe.snmp.ucd-snmp-mib.memSwapErrorMsg[]`)  
  Describes whether the amount of available swap space (as reported by 'memAvailSwap(4)'), is less than the desired minimum (specified by 'memMinimumSwap(12)').
* Swap error flag (`rabe.snmp.ucd-snmp-mib.memSwapError[]`)  
  Indicates whether the amount of available swap space (as reported by 'memAvailSwap(4)'), is less than the desired minimum (specified by 'memMinimumSwap(12)').
* Free memory (`rabe.snmp.ucd-snmp-mib.memTotalFree[]`)  
  The total amount of memory free or available for use on this host. This value typically covers both real memory and swap space or virtual memory.
* Total memory (`rabe.snmp.ucd-snmp-mib.memTotalReal[]`)  
  The total amount of real/physical memory installed.
* Total swap space (`rabe.snmp.ucd-snmp-mib.memTotalSwap[]`)  
  The total amount of swap space configured for this host.
### Macros
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_HIGH_THRESHOLD}` (default: 10G)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_WARNING_THRESHOLD}` (default: 20G)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_HIGH_THRESHOLD}` (default: 5)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_WARNING_THRESHOLD}` (default: 10)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_HIGH_THRESHOLD}` (default: 10G)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_WARNING_THRESHOLD}` (default: 20G)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_HIGH_THRESHOLD}` (default: 5)
* `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_WARNING_THRESHOLD}` (default: 10)
### Triggers
* Warning: Available memory on {HOST.NAME} is low (< $2 %, {ITEM.VALUE1} bytes available)
  ```
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memAvailReal[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_WARNING_THRESHOLD}
  
  and
  
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memPercentAvailReal[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_WARNING_THRESHOLD}
  ```
  The available memory on the system is below ` {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_WARNING_THRESHOLD}` and `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_WARNING_THRESHOLD}` percent.
* High: Available memory on {HOST.NAME} is very low (< $2 %, {ITEM.VALUE1} bytes available)
  ```
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memAvailReal[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_HIGH_THRESHOLD}
  
  and
  
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memPercentAvailReal[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_HIGH_THRESHOLD}
  ```
  The available memory on the system is below ` {$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_AVAILABLE_HIGH_THRESHOLD}` and `{$SNMPV2_UCD_SNMP_MIB_MEMORY_MEMORY_PAVAILABLE_HIGH_THRESHOLD}` percent.
* Warning: Available swap on {HOST.NAME} is low (< $2 %, {ITEM.VALUE1} bytes available)
  ```
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memAvailSwap[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_WARNING_THRESHOLD}
  
  and
  
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memPercentAvailSwap[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_WARNING_THRESHOLD}
  ```
  The available swap space on the system is below ` {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_WARNING_THRESHOLD}` and `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_WARNING_THRESHOLD}` percent.
* High: Available swap on {HOST.NAME} is very low (< $2 %, {ITEM.VALUE1} bytes available)
  ```
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memAvailSwap[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_HIGH_THRESHOLD}
  
  and
  
  {Template SNMPv2 UCD-SNMP-MIB memory:rabe.snmp.ucd-snmp-mib.memPercentAvailSwap[].last()}
    < {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_HIGH_THRESHOLD}
  ```
  The available swap space on the system is below ` {$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_AVAILABLE_HIGH_THRESHOLD}` and `{$SNMPV2_UCD_SNMP_MIB_MEMORY_SWAP_PAVAILABLE_HIGH_THRESHOLD}` percent.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
