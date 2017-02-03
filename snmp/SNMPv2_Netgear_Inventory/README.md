# Zabbix SNMPv2 Netgear Inventory template
Monitors Netgear Inventory parameters (fastPathInventory), namely switch units
and stack ports exposed by the NETGEAR-INVENTORY-MIB via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Uses low-level discovery to detect units and stack ports.
* Uses macros for trigger thresholds which can be easily adapted.
* Triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context), for fine grade threshold control.
* Dynamic bandwidth utilization triggers, respecting the stack port's current supported max bandwidth.

## Items
### Item prototypes for auto discovered units
* Status of unit
* Description of unit
* Management status of unit
* Standby status of unit
* Uptime of unit
* Code version of unit
* Serial number of unit

### Item prototypes for auto discovered stack ports
* Operational mode of stack port
* Configured mode of stack port 
* Link status of stack port
* Speed of stack port
* Traffic on stack port
* Errors on stack port

## Triggers
### Trigger prototypes for auto discovered units
* High: Status of unit not ok
* Warning: Unassigned unit
* Information: Management status of unit changed
* Information: Standby status of unit changed
* Information: Unit has been restarted

### Trigger prototypes for auto discovered stack ports
* High: Link status down on unit
* High: Port utilization is very high (> 90% over 1h)
* Warning: Port utilization is high (> 80% over 15m)
* Information: Operational mode on stack port changed

## Graphs
### Graph prototypes for auto discovered stack ports
* Traffic on stack port

## Macros
* <code>{$SNMP_COMMUNITY}</code>

  SNMPv2 community which defaults to <code>public</code>

* <code>{$SNMPV2_NETGEAR_INVENTORY_UTILIZATION_HIGH_PERCENTAGE}</code>

  Stack port utilization/staturation in percent for HIGH trigger (90% per default)

* <code>{$SNMPV2_NETGEAR_INVENTORY_UTILIZATION_HIGH_TIME}</code>

  Time for which the stack port  must be saturated for HIGH trigger (1h per default)  

* <code>{$SNMPV2_NETGEAR_INVENTORY_UTILIZATION_WARNING_PERCENTAGE}</code>

  Stack port utilization/staturation in percent for WARNING trigger (80% per default)
  
* <code>{$SNMPV2_NETGEAR_INVENTORY_UTILIZATION_WARNING_TIME}</code>

  Time for which the stack port must be saturated for WARNING trigger (15m per default)

Note, that the triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context),
so you can override a specific macro not only globally, but also per stack port
(such as <code>{$SNMPV2_NETGEAR_INVENTORY_UTILIZATION_WARNING_TIME:"{#AGENTINVENTORYSTACKPORTUNIT}_{#AGENTINVENTORYSTACKPORTTAG}"}</code>
for example).

## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your host must support SNMPv2
* NETGEAR-INVENTORY-MIB and its dependencies must be available and accessible by the Zabbix server (should be present within the MIB package of your Netgear device)

## Usage
1. Import the [Template_SNMPv2_Netgear_Inventory.xml](Template_SNMPv2_Netgear_Inventory.xml) into your Zabbix server.
2. Add the template to your host (or stack template)
3. Add an SNMP interface configuration to your host
4. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if you don't use <code>public</code>
5. Check if new data arrives

## Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)
* [SNMPv2 Interface HC](../SNMPv2_Interface_HC)
* [SNMPv2 Netgear Box Services](../SNMPv2_Netgear_Box_Services)
* [SNMPv2 Netgear SNTP client](../SNMPv2_Netgear_SNTP_client)
* [SNMPv2 Netgear Switching](../SNMPv2_Netgear_Switching)

# Notes
## snmpwalk command
The following <code>snmpwalk</code> command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> NETGEAR-INVENTORY-MIB::fastPathInventory
```

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
