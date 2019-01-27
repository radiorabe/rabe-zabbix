An external script is used for low-level discovery of the sensors (as Zabbix currently lacks LLD of IPMI sensors).

## Usage
1. Install the [IPMI sensor discovery script](../Sensor_Discovery).
2. Import the [IPMI Module Board Generic Sensors template](../Module_Board_Generic_Sensors).
3. Import the [IPMI Power Supply Generic Sensors template](../Power_Supply_Generic_Sensors).
4. Import the [IPMI Threshold Sensors template](../Threshold_Sensors).
5. Import the
   [`Template_IPMI_Supermicro_SSG-6048R-E1CR24N.xml`](Template_IPMI_Supermicro_SSG-6048R-E1CR24N.xml)
   into your Zabbix server.
6. Add the template to your host (or stack template)
7. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
8. Add an IPMI interface to your host
9. Configure the IPMI parameters of your host
10. Check if new data arrives
