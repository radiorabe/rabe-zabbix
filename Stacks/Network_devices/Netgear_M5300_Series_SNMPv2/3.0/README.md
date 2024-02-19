# Zabbix Netgear M5300 Series template
Zabbix *stack* template for monitoring [Netgear M5300
Series](http://netgear.com/business/products/switches/managed/m5300.aspx)
(Stackable Gigabit L2/L3 Managed Switches) devices via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Uses low-level discovery in order to detect units, network interfaces, stack
ports, fans, power supplies and sensors 
* Supports multi-unit devices (such as switch stacks)
* Uses HC 64bit parameters (such as ifHCInOctets and ifHCOutOctets)
* Uses macros for trigger thresholds which can be easily adapted.
* Triggers support [macro contexts](https://www.zabbix.com/documentation/3.0/manual/config/macros/usermacros#macro_context), for fine grade threshold control.
* Triggers contain the interface's ID together with the alias name
 * Example: <code>Operational status down on switch-01.example.com interface g1 (server-01.eth0)</code>
* Dynamic bandwidth utilization triggers, respecting the interface's current supported max bandwidth.

## Items
Overview:
* Alias and description of interfaces
* Status of interfaces
* Bandwidth and package statistics of interfaces
* Status of fans, power supplies and temperature sensors
* Status of units
* Status and bandwidth of stack ports
* Status of SNTP client
* Memory and CPU utilization

For a detailed list of all supported items refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic items](../../snmp/SNMPv2_Generic#items)
* [SNMPv2 Interfaces HC items](../../snmp/SNMPv2_Interfaces_HC#items)
* [SNMPv2 Netgear Box Services items](../../snmp/SNMPv2_Netgear_Box_Services#items)
* [SNMPv2 Netgear Inventory items](../../snmp/SNMPv2_Netgear_Inventory#items)
* [SNMPv2 Netgear SNTP client items](../../snmp/SNMPv2_Netgear_SNTP_client#items)
* [SNMPv2 Netgear Switching items](../../snmp/SNMPv2_Netgear_Switching#items)


## Triggers
Overview:
* Operational status changes
* Inbound/Outbound bandwidth utilization
* Fan, power supply or temperature sensor problems
* Unit status problems
* Stack port status and bandwidth utilization
* SNTP synchronization failed
* Free memory exhaustion

For a detailed list of all supported triggers refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic triggers](../../snmp/SNMPv2_Generic#triggers)
* [SNMPv2 Interfaces HC triggers](../../snmp/SNMPv2_Interfaces_HC#triggers)
* [SNMPv2 Netgear Box Services triggers](../../snmp/SNMPv2_Netgear_Box_Services#triggers)
* [SNMPv2 Netgear Inventory triggers](../../snmp/SNMPv2_Netgear_Inventory#triggers)
* [SNMPv2 Netgear SNTP client triggers](../../snmp/SNMPv2_Netgear_SNTP_client#triggers)
* [SNMPv2 Netgear Switching triggers](../../snmp/SNMPv2_Netgear_Switching#triggers)

## Graphs
Overview:
* Bandwidth and package statistics of interfaces
* Fan and temperature sensor statistics
* Stack port traffic
* Memory usage

For a detailed list of all supported graphs refer to the documentation of the
following sub-templates:
Supports the graphs of the following sub-templates:
* [SNMPv2 Generic graphs](../../snmp/SNMPv2_Generic#graphs)
* [SNMPv2 Interfaces HC graphs](../../snmp/SNMPv2_Interfaces_HC#graphs)
* [SNMPv2 Netgear Box Services graphs](../../snmp/SNMPv2_Netgear_Box_Services#graphs)
* [SNMPv2 Netgear Inventory graphs](../../snmp/SNMPv2_Netgear_Inventory#graphs)
* [SNMPv2 Netgear Switching graphs](../../snmp/SNMPv2_Netgear_Switching#graphs)

## Macros
* SNMP community
* Interface and stack port utilization trigger thresholds
* Memory utilization trigger thresholds

For a detailed list of all supported macros refer to the documentation of the
following sub-templates:
* [SNMPv2 Generic macros](../../snmp/SNMPv2_Generic#macros)
* [SNMPv2 Interfaces HC macros](../../snmp/SNMPv2_Interfaces_HC#macros)
* [SNMPv2 Netgear Box Services macros](../../snmp/SNMPv2_Netgear_Box_Services#macros)
* [SNMPv2 Netgear Inventory macros](../../snmp/SNMPv2_Netgear_Inventory#macros)
* [SNMPv2 Netgear SNTP client macros](../../snmp/SNMPv2_Netgear_SNTP_client#macros)
* [SNMPv2 Netgear Switching macros](../../snmp/SNMPv2_Netgear_Switching#macros)

## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your device must have SNMPv2 enabled
* IF-MIB must be available and accessible by the Zabbix server (which is
  probably already the case on your system)

## Usage
1. Download and install the MIBs for the 5300 series
```bash
cd /var/tmp
wget http://www.downloads.netgear.com/files/GDC/M5300/m5300v11.0.0.23-mibs.zip
unzip m5300v11.0.0.23-mibs.zip
cd m5300v11.0.0.23-mibs/

# Install only relevant MIBs 
cp cheetahref.my \
   fastpath*.my \
   ospf.my \
   pbridge.my \
   pimbsrrfc5240.my \
   power_ethernet.my \
   qos.my \
   ripv2.my \
   vlan.my \
   vrrp.my \
   /usr/local/share/snmp/mibs/.

# Clean up
cd ..
rm -rf m5300v11.0.0.23-mibs* 
```

2. Restart your Zabbix server (on systemd systems: <code>systemctl restart zabbix.service</code>)
3. Import the following sub-templates into your Zabbix server:
  * [Template_SNMPv2_Generic.xml](../../snmp/Template_SNMPv2_Generic/Template_SNMPv2_Generic.xml)
  * [Template_SNMPv2_Interfaces_HC.xml](../../snmp/Template_SNMPv2_Interfaces_HC/Template_SNMPv2_Interfaces_HC.xml)
  * [Template_SNMPv2_Netgear_Box_Services.xml](../../snmp/SNMPv2_Netgear_Box_Services/Template_SNMPv2_Netgear_Box_Services.xml)
  * [Template_SNMPv2_Netgear_Inventory.xml](../../snmp/SNMPv2_Netgear_Inventory/Template_SNMPv2_Netgear_Inventory.xml)
  * [Template_SNMPv2_Netgear_SNTP_client.xml](../../snmp/SNMPv2_Netgear_SNTP_client/Template_SNMPv2_Netgear_SNTP_client.xml)
  * [Template_SNMPv2_Netgear_Switching.xml](../../snmp/SNMPv2_Netgear_Switching/Template_SNMPv2_Netgear_Switching.xml)
4. Import the
   [Template_Stack_Netgear_M5300_Series_SNMPv2.xml](Template_Stack_Netgear_M5300_Series_SNMPv2.xml) into
   your Zabbix server.
5. Add the template to your host (or stack template)
6. Add an SNMP interface configuration to your host
7. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if
   you don't use <code>public</code>
8. Check if new data arrives
9. You might want to disable the <code>Operational status down on ...</code>
   triggers on interfaces which aren't supposed to be up all the time

## Linked templates
* [SNMPv2 Generic](../../snmp/Template_SNMPv2_Generic)
* [SNMPv2 Interfaces HC](../../snmp/Template_SNMPv2_Interfaces_HC)
* [SNMPv2 Netgear Box Services](../../snmp/SNMPv2_Netgear_Box_Services)
* [SNMPv2 Netgear Inventory](../../snmp/SNMPv2_Netgear_Inventory)
* [SNMPv2 Netgear SNTP client](../../snmp/SNMPv2_Netgear_SNTP_client)
* [SNMPv2 Netgear Switching](../../snmp/SNMPv2_Netgear_Switching)

## Related templates
* [Netgear GS108Tv2 SNMPv2](../Netgear_GS108Tv2_SNMPv2)

# Notes
## snmpwalk commands
The following <code>snmpwalk</code> commands might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST>
snmpwalk -v 2c -c public <HOST> NETGEAR-BOXSERVICES-PRIVATE-MIB::fastPathBoxServices
snmpwalk -v 2c -c public <HOST> NETGEAR-INVENTORY-MIB::fastPathInventory
snmpwalk -v 2c -c public <HOST> NETGEAR-SNTP-CLIENT-MIB::agentSntpClientMIB
snmpwalk -v 2c -c public <HOST> NETGEAR-SWITCHING-MIB::fastPathSwitching
```

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
