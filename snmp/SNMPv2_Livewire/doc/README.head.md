Monitoring of [Telos Alliance
Livewire](https://www.telosalliance.com/Axia/Livewire-AoIP-Networking) devices
via SNMPv2, such as the [Axia
xNodes](https://www.telosalliance.com/Axia/xNodes).

There are low-level discovery rules for detecting and monitoring the available
Livewire source and destination ports.

## Usage
1. Download the [MIB files for Axia
   xNodes](https://www.telosalliance.com/support/xNode-MIB-Files-for-SNMP-Support) 
2. Place the MIB files into your default MIB directory (usually
   `/usr/local/share/snmp/mibs`) and make sure that the Zabbix server loads
   them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
3. Restart your Zabbix server
4. Import the [Template_SNMPv2_Livewire.xml](Template_SNMPv2_Livewire.xml) into your Zabbix server.
5. Add the template to you host (or stack template)
6. Check if new data arrives

## Notes
### snmpwalk command
The following `snmpwalk` command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> TLS-SMI::livewire
```
