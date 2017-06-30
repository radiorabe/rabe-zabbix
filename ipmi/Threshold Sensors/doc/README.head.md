Monitoring of auto-discovered IPMI threshold sensors (Temperature, Voltage,
Current and Fan types).

An external script is used for low-level discovery of the sensors (as Zabbix
currently lacks LLD of IPMI sensors).

Triggers will be created for each discovered sensor, according to their
advertised lower and upper non-critical, critical and non-recoverable
thresholds.

## Usage
1. [install the IPMI sensor discovery script](../../Sensor Discovery).
2. Import the
   [Template_IPMI_Threshold_Sensors.xml](../Template_IPMI_Threshold_Sensors.xml)
   into your Zabbix server.
3. Add the template to your host (or stack template)
4. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
5. Add an IPMI interface to your host
6. Configure the IPMI parameters of your host
7. Check if new data arrives
