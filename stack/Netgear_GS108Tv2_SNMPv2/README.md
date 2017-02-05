# Zabbix Netgear GS108Tv2 template
Zabbix *stack* template for monitoring [Netgear
GS108Tv2](https://www.netgear.com/support/product/GS108Tv2) (ProSAFE 8-Port
Gigabit Smart Switch) devices via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Uses low-level discovery for the available network interfaces
* Uses HC 64bit parameters (such as ifHCInOctets and ifHCOutOctets)
* Uses macros for trigger thresholds which can be easily adapted.
* Triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context), for fine grade threshold control.
* Triggers contain the interface's ID together with the alias name
 * Example: <code>Operational status down on switch-01.example.com interface g1 (server-01.eth0)</code>
* Dynamic bandwidth utilization triggers, respecting the interface's current supported max bandwidth.

## Items
* Alias and description of interfaces
* Status of interfaces
* Bandwidth and package statistics of interfaces

For a detailed list of all supported items refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic items](../../snmp/SNMPv2_Generic#items)
* [SNMPv2 Interfaces HC items](../../snmp/SNMPv2_Interfaces_HC#items)


## Triggers
* Operational status changes
* Inbound/Outbound bandwidth utilization

For a detailed list of all supported triggers refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic triggers](../../snmp/SNMPv2_Generic#triggers)
* [SNMPv2 Interfaces HC triggers](../../snmp/SNMPv2_Interfaces_HC#triggers)

## Graphs
* Bandwidth and package statistics of interfaces

For a detailed list of all supported graphs refer to the documentation of the
following sub-templates:
Supports the graphs of the following sub-templates:
* [SNMPv2 Generic graphs](../../snmp/SNMPv2_Generic#graphs)
* [SNMPv2 Interfaces HC graphs](../../snmp/SNMPv2_Interfaces_HC#graphs)

## Macros
* SNMP community
* Interface utilization trigger thresholds

For a detailed list of all supported macros refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic macros](../../snmp/SNMPv2_Generic#macros)
* [SNMPv2 Interfaces HC macros](../../snmp/SNMPv2_Interfaces_HC#macros)

## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your device must have SNMPv2 enabled
* IF-MIB must be available and accessible by the Zabbix server (which is
  probably already the case on your system)

## Usage
1. Import the
   [Template_SNMPv2_Generic.xml](../../snmp/Template_SNMPv2_Generic/Template_SNMPv2_Generic.xml)
   and
   [Template_SNMPv2_Interfaces_HC.xml](../../snmp/Template_SNMPv2_Interfaces_HC/Template_SNMPv2_Interfaces_HC.xml)
   sub-templates into your Zabbix server.
2. Import the
   [Template_SNMPv2_Interfaces_HC.xml](Template_SNMPv2_Interfaces_HC.xml) into
   your Zabbix server.
3. Add the template to your host (or stack template)
4. Add an SNMP interface configuration to your host
5. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if
   you don't use <code>public</code>
6. Check if new data arrives
7. You might want to disable the <code>Operational status down on ...</code>
   triggers on interfaces which aren't supposed to be up all the time

## Linked templates
* [Template SNMPv2 Generic](../../snmp/Template_SNMPv2_Generic)
* [Template SNMPv2 Interfaces HC](../../snmp/Template_SNMPv2_Interfaces_HC)

## Related templates
* [Template Stack Netgear M5300 Series SNMPv2](../Template_Stack_Netgear_M5300_Series_SNMPv2)

# Notes
## snmpwalk command
The following <code>snmpwalk</code> command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST>
```

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
