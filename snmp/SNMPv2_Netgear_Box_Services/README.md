# Zabbix SNMPv2 Netgear Box Setvices template
Monitors Netgear Box Searvice Feature parameters, such as sensors, fans and
power supplies exposed by the NETGEAR-BOXSERVICES-PRIVATE-MIB via SNMPv2.

This template is part of [RaBe's Zabbix template and helpers collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Uses low-level discovery in order to detect fans, power supplies and temperature sensors.
* Supports multi-unit devices (such as switch stacks)

## Items
### Item prototypes for auto discovered fans
* Type of fan
* Duty level of fan
* Speed of fan
* Status of fan

### Item prototypes for auto discovered power supplies
* Type of power supply
* Status of power supply

### Item prototypes for auto discovered temperature sensors
* Type of sensor
* Temperature of sensor
* State of sensor

## Triggers
### Trigger prototypes for auto discovered fans
* High: Fan is not operational

### Trigger prototypes for auto discovered power supplies
* High: Power supply is not operational

### Trigger prototypes for auto discovered temperature sensors
* High: Temperature sensor is not normal

## Graphs
### Graph prototypes for auto discovered fans
* Fan duty
* Fan speed

### Graph prototypes for auto discovered temperature sensors
* Temperature of sensor

## Macros
* <code>{$SNMP_COMMUNITY}</code>

  SNMPv2 community which defaults to <code>public</code>

## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your host must support SNMPv2
* NETGEAR-BOXSERVICES-PRIVATE-MIB and its dependencies must be available and accessible by the Zabbix server (should be present within the MIB package of your Netgear device)

## Usage
1. Import the [Template_SNMPv2_Netgear_Box_Services.xml](Template_SNMPv2_Netgear_Box_Services.xml) into your Zabbix server.
2. Add the template to your host (or stack template)
3. Add an SNMP interface configuration to your host
4. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if you don't use <code>public</code>
5. Check if new data arrives

## Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)
* [SNMPv2 Interface HC](../SNMPv2_Interface_HC)
* [SNMPv2 Netgear Inventory](../SNMPv2_Netgear_Inventory)
* [SNMPv2 Netgear SNTP client](../SNMPv2_Netgear_SNTP_client)
* [SNMPv2 Netgear Switching](../SNMPv2_Netgear_Switching)

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
