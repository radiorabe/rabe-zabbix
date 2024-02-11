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
