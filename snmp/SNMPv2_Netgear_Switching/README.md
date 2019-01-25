# Zabbix SNMPv2 Netgear Switching monitoring
Monitors Netgear Switching parameters (fastPathSwitching), currently only CPU,
memory and spanning tree protocol information exposed by the
NETGEAR-SWITCHING-MIB via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage
1. Download the NETGEAR-SWITCHING-MIB and its dependencies (should be present
   within the MIB package of your Netgear device) 
2. Place the MIB file(s) into your default MIB directory on the Zabbix server
   and/or proxy (usually `/usr/local/share/snmp/mibs`) and make sure that the
   Zabbix server and/or proxy loads them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
3. Import the
   [`Template_SNMPv2_Netgear_Switching.xml`](Template_SNMPv2_Netgear_Switching.xml)
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
snmpwalk -v 2c -c public <HOST> NETGEAR-SWITCHING-MIB::fastPathSwitching
```

### CPU utilization
The CPU utilization is currently only available as a string with 5, 60 and 300
second values (`5 Secs ( 13.2483%)   60 Secs ( 11.3541%)  300 Secs (11.2930%)`
which makes it very hard or impossible to create triggers.

Please open up an issue if you know of an elegant way to either parse and split
the item into separate float items or if you find other OIDs which separately
expose the values - thanks.

### Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)
* [SNMPv2 Interface HC](../SNMPv2_Interface_HC)
* [SNMPv2 Netgear Box Services](../SNMPv2_Netgear_Box_Services)
* [SNMPv2 Netgear Inventory](../SNMPv2_Netgear_Inventory)
* [SNMPv2 Netgear SNTP Client](../SNMPv2_Netgear_SNTP_CLIENT)
## Template SNMPv2 Netgear Switching
Template for Netgear Private MIB for FastPath Switching based on NETGEAR-SWITCHING-MIB
### Items
* STP admin mode (`agentStpAdminMode[]`)  
  The spanning tree operational status
* STP CIST bridge forward delay (`agentStpCstBridgeFwdDelay[]`)  
  The MSTP bridge forward delay for the CIST.
* STP CIST bridge hello time (`agentStpCstBridgeHelloTime[]`)  
  The MSTP bridge hello time for the CIST.
* STP CIST bridge hold count (`agentStpCstBridgeHoldCount[]`)  
  The MSTP bridge hold count for the CIST. The value of maximum bpdus that a bridge is allowed to send within a hello time window.
* STP CIST bridge hold time (`agentStpCstBridgeHoldTime[]`)  
  The MSTP bridge hold time for the CIST.
* STP CIST bridge max age (`agentStpCstBridgeMaxAge[]`)  
  The MSTP bridge max age for the CIST.
* STP CIST bridge max hops (`agentStpCstBridgeMaxHops[]`)  
  The MSTP bridge max hops for the CIST.
* STP CIST bridge priority (`agentStpCstBridgePriority[]`)  
  The MSTP bridge priority for the CIST.
* STP CIST root port hello time (`agentStpCstHelloTime[]`)  
  The MSTP root port hello time for the CIST.
* STP CIST root port max age (`agentStpCstMaxAge[]`)  
  The MSTP root port max age for the CIST.
* STP CIST regional root ID (`agentStpCstRegionalRootId[]`)  
  The MSTP regional root identifier for the CIST.
* STP CIST regional root path cost (`agentStpCstRegionalRootPathCost[]`)  
  The MSTP regional root path cost for the CIST.
* STP CIST root port forward delay (`agentStpCstRootFwdDelay[]`)  
  The MSTP root port forward delay for the CIST.
* STP protocol version (`agentStpForceVersion[]`)  
  The MST configuration force protocol version.
* Total memory (`agentSwitchCpuProcessMemAvailable[]`)  
  The total memory available in KBytes.
* Free memory (`agentSwitchCpuProcessMemFree[]`)  
  The total memory free for utilization in KBytes.
* Total CPU utilization (`agentSwitchCpuProcessTotalUtilization[]`)  
  Total CPU utilization over a period of 5, 60, 300 seconds, and the Rising threshold period also in seconds, if configured.
### Macros
* `{$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_WARNING_THRESHOLD}` (default: 10)
### Discovery
#### Multiple spanning tree protocol instances (`agentStpMstId.discovery`)
Discovery of multiple spanning tree protocol instances (STP MST), including the common and internal spanning tree instance 0.
##### Item Prototypes
* MSTP bridge identifier of instance $1 (`agentStpMstBridgeIdentifier[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP bridge identifier in a specific instance.
* MSTP bridge priority of instance $1 (`agentStpMstBridgePriority[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP bridge priority in a specific instance. The priority is in the increments of 4096. The recommended default value is 32768.
* MSTP designated root bridge identifier of instance $1 (`agentStpMstDesignatedRootId[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP designated root bridge identifier in a specific instance.
* MSTP root path cost of instance $1 (`agentStpMstRootPathCost[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP root path cost in a specific instance.
* MSTP designated root port ID of instance $1 (`agentStpMstRootPortId[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP root port ID in a specific instance.
* MSTP time since the last topology change of instance $1 (`agentStpMstTimeSinceTopologyChange[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP time since the last topology change in a specific instance.
* MSTP count of topology changes of instance $1 (`agentStpMstTopologyChangeCount[{#NETGEAR_SWITCHING_STP_MST_ID}]`)  
  The MSTP count of topology changes in a specific instance.
##### Trigger Prototypes
* Warning: Recent spanning tree topology change on MST instance {#NETGEAR_SWITCHING_STP_MST_ID} on {HOST.NAME}
  ```
  {Template SNMPv2 Netgear Switching:agentStpMstTimeSinceTopologyChange[{#NETGEAR_SWITCHING_STP_MST_ID}].last()}<900
  ```
  There was a spanning tree topology change on the multiple spanning tree instance `{#NETGEAR_SWITCHING_STP_MST_ID}` during the last 15 minutes.
### Triggers
* Warning: Free memory on {HOST.NAME} is low (< $2 %, {ITEM.VALUE2} available)
  ```
  100 / {Template SNMPv2 Netgear Switching:agentSwitchCpuProcessMemAvailable[].last()} *
  {Template SNMPv2 Netgear Switching:agentSwitchCpuProcessMemFree[].last()} < {$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_WARNING_THRESHOLD}
  ```
* High: Free memory on {HOST.NAME} is very low (< $2 %, {ITEM.VALUE2} available)
  ```
  100 / {Template SNMPv2 Netgear Switching:agentSwitchCpuProcessMemAvailable[].last()} *
  {Template SNMPv2 Netgear Switching:agentSwitchCpuProcessMemFree[].last()} < {$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_HIGH_THRESHOLD}
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
