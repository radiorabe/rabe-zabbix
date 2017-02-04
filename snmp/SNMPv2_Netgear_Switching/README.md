# Zabbix SNMPv2 Netgear Switching template
Monitors Netgear Switching parameters (fastPathSwitching), currently only CPU and memory exposed by the NETGEAR-SWITCHING-MIB via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Well, not that much. It supports only CPU and memory parameters at the moment.
* Uses macros for trigger thresholds which can be easily adapted.

## Items
* Total memory
* Free memory
* Total CPU utilization

## Triggers
* High: Free memory is very low (< 5%)
* Warning: Free memory is low (< 10%)

## Macros
* <code>{$SNMP_COMMUNITY}</code>

  SNMPv2 community which defaults to <code>public</code>

* <code>{$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_HIGH_THRESHOLD}</code>

  Free memory in percent for HIGH trigger (5% per default)

* <code>{$SNMPV2_NETGEAR_SWITCHING_MEMORY_PFREE_WARNING_THRESHOLD}</code>

  Free memory in percent for WARNING trigger (10% per default)


## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your host must support SNMPv2
* NETGEAR-SWITCHING-MIB and its dependencies must be available and accessible by the Zabbix server (should be present within the MIB package of your Netgear device)

## Usage
1. Import the [Template_SNMPv2_Netgear_Switching.xml](Template_SNMPv2_Netgear_Switching.xml) into your Zabbix server.
2. Add the template to your host (or stack template)
3. Add an SNMP interface configuration to your host
4. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if you don't use <code>public</code>
5. Check if new data arrives

## Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)
* [SNMPv2 Interface HC](../SNMPv2_Interface_HC)
* [SNMPv2 Netgear Box Services](../SNMPv2_Netgear_Box_Services)
* [SNMPv2 Netgear Inventory](../SNMPv2_Netgear_Inventory)
* [SNMPv2 Netgear SNTP Client](../SNMPv2_Netgear_SNTP_CLIENT)

# Notes
## snmpwalk command
The following <code>snmpwalk</code> command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> NETGEAR-SWITCHING-MIB::fastPathSwitching
```

## CPU utilization
The CPU utilization is currently only available as a string with 5, 60 and 300
second values (<code>5 Secs ( 13.2483%)   60 Secs ( 11.3541%)  300 Secs (11.2930%)</code>
which makes it very hard or impossible to create triggers.

Please open up an issue if you know of an elegant way to either parse and split
the item into separate float items or if you find other OIDs which separately
expose the values - thanks.

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
