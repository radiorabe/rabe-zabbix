# Zabbix SNMPv2 Netgear SNTP client template
Monitors Netgear SNTP client parameters (agentSntpClientMIB), such as client
status and NTP server parameters exposed by the NETGEAR-SNTP-CLIENT-MIB via
SNMPv2.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Features
* Monitoring of SNTP client status
* Monitoring of NTP server details

## Items
* SNTP client last attempt status
* SNTP client last attempt time
* SNTP client last update time
* SNTP client mode
* SNTP client poll interval
* SNTP client server address
* SNTP client server address type
* SNTP client server mode
* SNTP client server stratum

## Triggers
* High: SNTP attempt status was unsuccessfull (requires two failed attempts to fire)
* Warning: SNTP client is disabled

## Macros
* <code>{$SNMP_COMMUNITY}</code>

  SNMPv2 community which defaults to <code>public</code>


## Requirements
* [Zabbix](https://www.zabbix.com/) >= 3.0
* Your host must support SNMPv2
* NETGEAR-SNTP-CLIENT-MIB and its dependencies must be available and accessible by the Zabbix server (should be present within the MIB package of your Netgear device)

## Usage
1. Import the [Template_SNMPv2_Netgear_SNTP_client.xml](Template_SNMPv2_Netgear_SNTP_client.xml) into your Zabbix server.
2. Add the template to your host (or stack template)
3. Add an SNMP interface configuration to your host
4. Set the <code>{$SNMP_COMMUNITY}</code> macro to your desired community if you don't use <code>public</code>
5. Check if new data arrives

## Related templates
* [SNMPv2 Generic](../SNMPv2_Generic)
* [SNMPv2 Interface HC](../SNMPv2_Interface_HC)
* [SNMPv2 Netgear Box Services](../SNMPv2_Netgear_Box_Services)
* [SNMPv2 Netgear Inventory](../SNMPv2_Netgear_Inventory)
* [SNMPv2 Netgear Switching](../SNMPv2_Netgear_Switching)

# Notes
## snmpwalk command
The following <code>snmpwalk</code> command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> NETGEAR-SNTP-CLIENT-MIB::agentSntpClientMIB
```

# License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

# Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
