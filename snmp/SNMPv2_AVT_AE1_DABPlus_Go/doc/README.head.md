Monitoring of [AVT MAGIC AE1 DAB+ Go](http://www.avt-nbg.de/index.php/en/products/dab/encoders/magic-ae1-dab-go) devices.

There are low-level discovery rules for detecting and monitoring the available
alarms and encoders.

## Usage
1. Download the [MAGIC AE1 DAB+
   GO](http://www.avt-nbg.de/index.php/en/download-2/software-download) software.
2. Start the *MAGIC AE1 DAB+ GO* software (note that it might also run on
   [Wine](https://www.winehq.org/) under Linux)
3. Configure SNMP (`Configuration -> MAGIC AE1 DAB+ GO -> System Settings ->
   SNMP Parameters`)
	* SNMP Version: `v2c`
	* Read Community: `public`
	* SNMP Port: `161`
	* Fill out the System *Description*, *Contact* and *Location*
4. Copy the `AVT-*.mib` MIB files to your Zabbix Server (they are located at
   `C:\Program Files (x86)\AVT\MAGIC AE1 DAB+ Go\MIB`)
5. Place the MIB files into your default MIB directory (usually
   `/usr/local/share/snmp/mibs`) and make sure that the Zabbix server loads
   them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
6. Restart your Zabbix server
7. Import the [Template_SNMPv2_AVT_AE1_DABPlus_Go.xml](Template_SNMPv2_AVT_AE1_DABPlus_Go.xml)
   into your Zabbix server.
8. Add the template to your host (or stack template). You might also want to add
   the [SNMPv2_Generic](../SNMPv2_Generic) template.
9. Check if new data arrives

## Notes
### snmpwalk command
The following `snmpwalk` command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> AVT-AE1-DABPLUS-GO-MIB::avtMagicAe1DabPlusGoEncoder
```
