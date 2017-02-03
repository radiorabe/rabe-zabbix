# Zabbix SNMPv2 Interfaces HC template
Monitors common network interface parameters exposed by the IF-MIB via SNMPv2.
The template uses HC 64bit parameters (such as ifHCInOctets and ifHCOutOctets) where available.

This template is part of [RaBe's Zabbix template and helpers collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Uses low-level discovery for the available network interfaces
* Uses HC 64bit parameters (such as ifHCInOctets and ifHCOutOctets)
* Uses macros for trigger thresholds which can be easily adapted.
* Triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context), for fine grade threshold control.
* Triggers contain the interface's ID together with the alias name
 * Example: <code>Operational status down on switch-01.example.com interface 1/0/23 (server-01.eth0)</code>
* Dynamic bandwidth utilization triggers, respecting the interface's current supported max bandwidth.

## Items
* Number of network interfaces

### Item prototypes for auto discovered interfaces
* Admin and operational status of interface
* Alias and description of interface
* Nominal or current bandwidth of interface
* Inbound/Outbound traffic on interface
* Inbound/Outbound unicast packages on interface
* Inbound/Outbound broadcast packages on interface
* Inbound/Outbound multicast packages on interface
* Inbound/Outbound discards on interface
* Inbound/Outbound errors on interface

## Triggers
### Trigger prototypes for auto discovered interfaces
* Information: Operational status has changed
* Warning: Inbound/Outbound utilization is high (> 80% over 15m)
* Warning: Operational status of interface is down (if admin status is up)
* High: Inbound/Outbound utilization is very high (> 90% over 1h)

## Graphs
### Graph prototypes for auto discovered interfaces
* Packets on interface (Inbound/Outbound unicast, broadcast, multicast, errors and discards)
* Traffic on interface (Inbound/Outbound)

## Macros
* <code>{$SNMP_COMMUNITY}</code>

  SNMPv2 community which defaults to <code>public</code>

* <code>{$SNMPV2_INTERFACES_HC_IN_UTILIZATION_HIGH_PERCENTAGE}</code>

  Inbound interface utilization/staturation in percent for HIGH trigger (90% per default)

* <code>{$SNMPV2_INTERFACES_HC_IN_UTILIZATION_HIGH_TIME}</code>

  Inbound time for which the interface must be saturated for HIGH trigger (1h per default)

* <code>{$SNMPV2_INTERFACES_HC_IN_UTILIZATION_WARNING_PERCENTAGE}</code>

  Inbound interface utilization/staturation in percent for WARNING trigger (80% per default)

* <code>{$SNMPV2_INTERFACES_HC_IN_UTILIZATION_WARNING_TIME}</code>

  Inbound time for which the interface must be saturated for WARNING trigger (15m per default)

* <code>{$SNMPV2_INTERFACES_HC_OUT_UTILIZATION_HIGH_PERCENTAGE}</code>

  Outbound interface utilization/staturation in percent for HIGH trigger (90% per default)

* <code>{$SNMPV2_INTERFACES_HC_OUT_UTILIZATION_HIGH_TIME}</code>

  Outbound time for which the interface must be saturated for HIGH trigger (1h per default)

* <code>{$SNMPV2_INTERFACES_HC_OUT_UTILIZATION_WARNING_PERCENTAGE}</code>

  Outbound interface utilization/staturation in percent for WARNING trigger (80% per default)

* <code>{$SNMPV2_INTERFACES_HC_OUT_UTILIZATION_WARNING_TIME}</code>

  Outbound time for which the interface must be saturated for WARNING trigger (15m per default)

Note, that the triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context), so you can override a specific macro not only globally, but also per interface (such as <code>{$SNMPV2_INTERFACES_HC_IN_UTILIZATION_WARNING_PERCENTAGE:"{#SNMPVALUE}"}</code> for example).

## Requirements
* Your host must support SNMPv2
* IF-MIB must be available and accessible by the Zabbix server (which is probably already the case on your system)

## Usage
1. Import the [Template_SNMPv2_Interfaces_HC.xml](Template_SNMPv2_Interfaces_HC.xml) into your Zabbix server.
2. Add the template to your host (or stack template)
3. Add an SNMP interface configuration to your host
4. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if you don't use <code>public</code>
5. Check if new data arrives
6. You might want to disable the <code>Operational status down on ...</code> triggers on interfaces which aren't supposed to be up all the time

## Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)

# Authors
Christian Affolter <c.affolter@purplehaze.ch>
