# Zabbix SNMPv2 UBNT-UniFi-MIB monitoring
Monitors Ubiquiti device parameters, such as Ethernet, Radio and virtual access
point interfaces, exposed by the
[`UBNT-UniFi-MIB`](http://dl.ubnt-ut.com/snmp/UBNT-UniFi-MIB) via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage
1. Download the [`UBNT-UniFi-MIB`](http://dl.ubnt-ut.com/snmp/UBNT-UniFi-MIB) and [`UBNT-MIB`](http://dl.ubnt-ut.com/snmp/UBNT-MIB)
2. Place the MIB file(s) into your default MIB directory on the Zabbix server
   and/or proxy (usually `/usr/local/share/snmp/mibs`) and make sure that the
   Zabbix server and/or proxy loads them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
3. Import the
   [`Template_SNMPv2_UBNT-UniFi-MIB.xml`](Template_SNMPv2_UBNT-UniFi-MIB.xml)
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
snmpwalk -v 2c -c public <HOST> UBNT-MIB::ubnt
```
## Template SNMPv2 UBNT-UniFi-MIB
SNMPv2 template for monitoring Ubiquiti devices exposing [`UBNT-UniFi-MIB`](http://dl.ubnt-ut.com/snmp/UBNT-UniFi-MIB) (The UniFi MIB module for Ubiquiti Networks, Inc.) entities.
### Items
* IP address of access point (`rabe.snmp.ubnt-unifi-mib.unifiApSystemIp[]`)  
  The IP address of the access point.
* Model of access point (`rabe.snmp.ubnt-unifi-mib.unifiApSystemModel[]`)  
  The model of the access point.
* Uptime of access point (`rabe.snmp.ubnt-unifi-mib.unifiApSystemUptime[]`)  
  The uptime of the access point.
* Version of access point (`rabe.snmp.ubnt-unifi-mib.unifiApSystemVersion[]`)  
  The firmware version of the access point.
### Macros
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_PERCENTAGE}` (default: 90)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_TIME}` (default: 30m)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_PERCENTAGE}` (default: 80)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_TIME}` (default: 15m)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_PERCENTAGE}` (default: 90)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_TIME}` (default: 30m)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_PERCENTAGE}` (default: 80)
* `{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_TIME}` (default: 15m)
* `{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_PERCENTAGE}` (default: 95)
* `{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_TIME}` (default: 30m)
* `{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_PERCENTAGE}` (default: 85)
* `{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_TIME}` (default: 30m)
* `{$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_HIGH_THRESHOLD}` (default: 70)
* `{$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_WARNING_THRESHOLD}` (default: 50)
### Discovery
#### Ethernet interfaces (`rabe.snmp.ubnt-unifi-mib.unifiIfEntry.discovery`)
Discovery of Ethernet interfaces

Returns the following macro for each available Ethernet interface (`UbntIfEntry`)
* `{#IF_NAME}`
  * The name of each discovered Ethernet interface  (`UBNT-UniFi-MIB::unifiIfName`).
##### Item Prototypes
* IP address of Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfIp[{#IF_NAME}]`)  
  The IP address of the Ethernet interface.
* MAC address of Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfMac[{#IF_NAME}]`)  
  The MAC address of the Ethernet interface.
* Inbound traffic on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfRxBytes[{#IF_NAME}]`)  
  Received bits per second on the Ethernet interface.
* Inbound packets dropped on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfRxDropped[{#IF_NAME}]`)  
  Inbound dropped packets per second on the Ethernet interface.
* Inbound errors on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfRxError[{#IF_NAME}]`)  
  Inbound errors per second on the Ethernet interface.
* Inbound packets on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfRxPackets[{#IF_NAME}]`)  
  Inbound packets per second on the Ethernet interface.
* Speed of Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfSpeed[{#IF_NAME}]`)  
  Speed of the Ethernet interface.
* Outbound traffic on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfTxBytes[{#IF_NAME}]`)  
  Transmitted bits per second on the Ethernet interface.
* Outbound packets dropped on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfTxDropped[{#IF_NAME}]`)  
  Outbound dropped packets per second on the Ethernet interface.
* Outbound errors on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfTxError[{#IF_NAME}]`)  
  Outbound errors per second on the Ethernet interface.
* Outbound packets on Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfTxPackets[{#IF_NAME}]`)  
  Outbound packets per second on the Ethernet interface.
* Up status of Ethernet interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiIfUp[{#IF_NAME}]`)  
  The up status of the Ethernet interface.
##### Trigger Prototypes
* Warning: Inbound utilization is high (> $2 % over {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_TIME:"{#IF_NAME}"}) on {HOST.NAME} interface {#IF_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfRxBytes[{#IF_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_TIME:"{#IF_NAME}"})} > {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfSpeed[{#IF_NAME}].last()} / 100 * {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_PERCENTAGE:"{#IF_NAME}"}
  ```
  The inbound average interface utilization is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_PERCENTAGE:"{#IF_NAME}"}`) of the maximum interface speed over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_WARNING_TIME:"{#IF_NAME}"}`).
* High: Inbound utilization is very high (> $2 % over {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_TIME:"{#IF_NAME}"}) on {HOST.NAME} interface {#IF_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfRxBytes[{#IF_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_TIME:"{#IF_NAME}"})} > {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfSpeed[{#IF_NAME}].last()} / 100 * {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_PERCENTAGE:"{#IF_NAME}"}
  ```
  The inbound average interface utilization is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_PERCENTAGE:"{#IF_NAME}"}`) of the maximum interface speed over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_IN_UTILIZATION_HIGH_TIME:"{#IF_NAME}"}`).
* High: Interface status is down on {HOST.NAME} interface {#IF_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfUp[{#IF_NAME}].last()}<>1
  ```
  The Ethernet interface is down.
* Warning: Outbound utilization is high (> $2 % over {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_TIME:"{#IF_NAME}"}) on {HOST.NAME} interface {#IF_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfTxBytes[{#IF_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_TIME:"{#IF_NAME}"})} > {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfSpeed[{#IF_NAME}].last()} / 100 * {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_PERCENTAGE:"{#IF_NAME}"}
  ```
  The outbound average interface utilization is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_PERCENTAGE:"{#IF_NAME}"}`) of the maximum interface speed over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_WARNING_TIME:"{#IF_NAME}"}`).
* High: Outbound utilization is very high (> $2 % over {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_TIME:"{#IF_NAME}"}) on {HOST.NAME} interface {#IF_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfTxBytes[{#IF_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_TIME:"{#IF_NAME}"})} > {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiIfSpeed[{#IF_NAME}].last()} / 100 * {$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_PERCENTAGE:"{#IF_NAME}"}
  ```
  The outbound average interface utilization is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_PERCENTAGE:"{#IF_NAME}"}`) of the maximum interface speed over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_ETH_IF_OUT_UTILIZATION_HIGH_TIME:"{#IF_NAME}"}`).
#### Radio interfaces (`rabe.snmp.ubnt-unifi-mib.unifiRadioEntry.discovery`)
Discovery of radio interfaces.

Returns the following macro for each available radio interface (`unifiRadioEntry`)
* `{#RADIO_NAME}`
  * The name of each discovered radio interface (`UBNT-UniFi-MIB::unifiRadioName`).
##### Item Prototypes
* Channel utilization self receive on radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioCuSelfRx[{#RADIO_NAME}]`)  
  The self receive channel utilization on the radio interface in percent.
* Channel utilization self transmit on radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioCuSelfTx[{#RADIO_NAME}]`)  
  The self transmit channel utilization on the radio interface in percent.
* Channel utilization total on radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioCuTotal[{#RADIO_NAME}]`)  
  The total channel utilization on the radio interface in percent.
* Mode of radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioRadio[{#RADIO_NAME}]`)  
  The radio interface's mode.
* Received packets on radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioRxPackets[{#RADIO_NAME}]`)  
  The number of received packets on the radio interface per second.
* Transmitted packets on radio interface $1 (`rabe.snmp.ubnt-unifi-mib.unifiRadioTxPackets[{#RADIO_NAME}]`)  
  The number of transmitted packets on the radio interface per second.
##### Trigger Prototypes
* Warning: Total channel utilization is high (> $1% over {$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_TIME:"{#RADIO_NAME}"}) on {HOST.NAME} radio interface {#RADIO_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiRadioCuTotal[{#RADIO_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_TIME:"{#RADIO_NAME}"})} > {$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_PERCENTAGE:"{#RADIO_NAME}"}
  ```
  The total average channel utilization of the radio interface is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_PERCENTAGE:"{#RADIO_NAME}"}`) over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_WARNING_TIME:"{#RADIO_NAME}"}`).
* High: Total channel utilization is very high ( > $1% over {$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_TIME:"{#RADIO_NAME}"}) on {HOST.NAME} radio interface {#RADIO_NAME}
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiRadioCuTotal[{#RADIO_NAME}].avg({$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_TIME:"{#RADIO_NAME}"})} > {$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_PERCENTAGE:"{#RADIO_NAME}"}
  ```
  The total average channel utilization of the radio interface is higher than the configured percent value (`{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_PERCENTAGE:"{#RADIO_NAME}"}`) over the configured amount of time (`{$SNMPV2_UBNT_UNIFI_MIB_RADIO_IF_TOTAL_UTILIZATION_HIGH_TIME:"{#RADIO_NAME}"}`).
#### Virtual access point interfaces (`rabe.snmp.ubnt-unifi-mib.unifiVapEntry.discovery`)
Discovery of virtual access point interfaces

Returns the following macros for each available virtual access point interface (`unifiVapEntry`)
* `{#VAP_NAME}`
  * The name of each discovered virtual access point interface (`UBNT-UniFi-MIB::unifiVapName`).
* `{#VAP_ESSID}`
  * The (current) Extended Service Set (ESS) ID of each discovered virtual access point interface (`UBNT-UniFi-MIB::unifiVapEssId`).
##### Item Prototypes
* BSS ID of virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapBssId[{#VAP_NAME}]`)  
  The Basic Service Set (BSS) ID of the virtual access point.
* Channel of virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapChannel[{#VAP_NAME}]`)  
  The channel of the virtual access point.
* ESS ID of virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapEssId[{#VAP_NAME}]`)  
  The Extended Service Set (ESS) ID of the virtual access point.
* Number of connected stations on access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapNumStations[{#VAP_NAME}]`)  
  The number of connected stations on this virtual access point.
* Inbound traffic on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapRxBytes[{#VAP_NAME}]`)  
  Received bits per second on the virtual access point.
* Inbound packets dropped on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapRxDropped[{#VAP_NAME}]`)  
  Inbound dropped packets per second on the virtual access point.
* Inbound errors on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapRxErrors[{#VAP_NAME}]`)  
  Inbound errors per second on the virtual access point.
* Inbound packets on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapRxPackets[{#VAP_NAME}]`)  
  Inbound packets per second on the virtual access point.
* Inbound retries on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapRxRetries[{#VAP_NAME}]`)  
  Inbound retries per second on the virtual access point.
* Outbound traffic on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapTxBytes[{#VAP_NAME}]`)  
  Transmitted bits per second on the virtual access point.
* Outbound packets dropped on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapTxDropped[{#VAP_NAME}]`)  
  Outbound dropped packets per second on the virtual access point.
* Outbound errors on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapTxErrors[{#VAP_NAME}]`)  
  Outbound errors per second on the virtual access point.
* Outbound packets on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapTxPackets[{#VAP_NAME}]`)  
  Outbound packets per second on the virtual access point.
* Outbound retries on virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapTxRetries[{#VAP_NAME}]`)  
  Outbound retries per second on the virtual access point.
* Up status of virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapUp[{#VAP_NAME}]`)  
  The up status of the virtual access point.
* Usage type of virtual access point $1 (`rabe.snmp.ubnt-unifi-mib.unifiVapUsage[{#VAP_NAME}]`)  
  The usage type of the virtual access point.
##### Trigger Prototypes
* Warning: Many stations (> $1) connected to virtual access point on {HOST.NAME} interface {#VAP_NAME} ({#VAP_ESSID})
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiVapNumStations[{#VAP_NAME}].last()} >= {$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_WARNING_THRESHOLD:"{#VAP_NAME}"}
  ```
  There are many stations (> `{$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_WARNING_THRESHOLD:"{#VAP_NAME}"}`) connected to the virtual access point.
* High: Too many stations (> $1) connected to virtual access point on {HOST.NAME} interface {#VAP_NAME} ({#VAP_ESSID})
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiVapNumStations[{#VAP_NAME}].last()} >= {$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_HIGH_THRESHOLD:"{#VAP_NAME}"}
  ```
  There are too many stations (> `{$SNMPV2_UBNT_UNIFI_MIB_VAP_IF_CONNECTED_STATIONS_HIGH_THRESHOLD:"{#VAP_NAME}"}`) connected to the virtual access point.
* Information: Virtual access point ESS ID name was changed on {HOST.NAME} interface {#VAP_NAME} ({#VAP_ESSID})
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiVapEssId[{#VAP_NAME}].diff()}=1
  ```
  The ESS ID of the virtual access point was changed.
* High: Virtual access point status is down on {HOST.NAME} interface {#VAP_NAME} ({#VAP_ESSID})
  ```
  {Template SNMPv2 UBNT-UniFi-MIB:rabe.snmp.ubnt-unifi-mib.unifiVapUp[{#VAP_NAME}].last()}<>1
  ```
  The virtual access point interface is down.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
