# Zabbix SNMPv2 UCD-SNMP-MIB load average monitoring
Monitors system load average entry parameters exposed by the
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
   [`Template_SNMPv2_UCD-SNMP-MIB_load_average.xml`](Template_SNMPv2_UCD-SNMP-MIB_load_average.xml)
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
snmpwalk -v 2c -c public <HOST> UCD-SNMP-MIB::laTable
```
## Template SNMPv2 UCD-SNMP-MIB load average
SNMPv2 template for monitoring the load average of a host exposing the [`UCD-SNMP-MIB`](http://www.net-snmp.org/docs/mibs/ucdavis.html) (University of California, Davis MIB) `laTable` table.
### Macros
* `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_THRESHOLD}` (default: 15)
* `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_TIME}` (default: 30m)
* `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_THRESHOLD}` (default: 15)
* `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_TIME}` (default: 15m)
### Discovery
#### Load average entries (`rabe.snmp.ucd-snmp-mib.laEntry.discovery`)
Discovery of load average entries

Returns the following macro for each available load average entry (`laEntry`)
* `{#LA_INDEX}`
  * Reference index/row number for each discovered load average entry (`UCD-SNMP-MIB::laIndex`)
* `{#LA_NAME}`
  * The name of each discovered load average entry (`UCD-SNMP-MIB::laNames`).
##### Item Prototypes
* Load watch point of "{#LA_NAME}" (`rabe.snmp.ucd-snmp-mib.laConfig[{#SNMPINDEX}]`)  
  The watch point for load-average `{#LA_NAME}` to signal an error. 

If the load averages rises above this value, the laErrorFlag is set.
* Load error message for "{#LA_NAME}" (`rabe.snmp.ucd-snmp-mib.laErrMessage[{#SNMPINDEX}]`)  
  An error message describing the load-average and its surpased watch-point value.
* Error flag of "{#LA_NAME}" (`rabe.snmp.ucd-snmp-mib.laErrorFlag[{#SNMPINDEX}]`)  
  A Error flag to indicate the load-average has crossed its threshold value defined in the snmpd.conf file.
It is set to 1 if the threshold is crossed, 0 otherwise.
* Load "{#LA_NAME}" (`rabe.snmp.ucd-snmp-mib.laLoad[{#SNMPINDEX}]`)  
  The `{#LA_NAME}` minute load average.
##### Trigger Prototypes
* Warning: Processor load is high (> $1 over {$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_TIME:"{#LA_NAME}"} on {HOST.NAME}
  ```
  {Template SNMPv2 UCD-SNMP-MIB load average:rabe.snmp.ucd-snmp-mib.laLoad[{#SNMPINDEX}].avg({$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_TIME:"{#LA_NAME}"})}>{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_THRESHOLD:"{#LA_NAME}"}
  ```
  The average CPU load is over `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_TIME:"{#LA_NAME}"}` for the last `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_WARNING_TIME:"{#LA_NAME}}`.
* High: Processor load is very high (> $1 over {$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_TIME:"{#LA_NAME}"} on {HOST.NAME}
  ```
  {Template SNMPv2 UCD-SNMP-MIB load average:rabe.snmp.ucd-snmp-mib.laLoad[{#SNMPINDEX}].avg({$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_TIME:"{#LA_NAME}"})}>{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_THRESHOLD:"{#LA_NAME}"}
  ```
  The average CPU load is over `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_TIME:"{#LA_NAME}"}` for the last `{$SNMPV2_UCD_SNMP_MIB_LOAD_AVERAGE_CPU_LOAD_HIGH_TIME:"{#LA_NAME}"}`.
* Warning: Processor load {#LA_NAME} is higher than the system watch point ({ITEM.VALUE1} > {ITEM.VALUE2}) on {HOST.NAME})
  ```
  {Template SNMPv2 UCD-SNMP-MIB load average:rabe.snmp.ucd-snmp-mib.laLoad[{#SNMPINDEX}].last()}>{Template SNMPv2 UCD-SNMP-MIB load average:rabe.snmp.ucd-snmp-mib.laConfig[{#SNMPINDEX}].last()}
  ```
  The load average is higher than the system configured watch point (`UCD-SNMP-MIB::laConfig`).

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
