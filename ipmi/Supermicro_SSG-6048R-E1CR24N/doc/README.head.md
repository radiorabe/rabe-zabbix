Monitoring of Supermicro SuperStorage Server
[6048R-E1CR24N](https://www.supermicro.com/products/system/4u/6048/ssg-6048r-e1cr24n.cfm)
IPMI sensors. 

The template supports IPMI drive slots sensors (sensor type code `0Dh`), power
supplies sensors (sensor type code `08h`) and threshold based sensors (reading
type 01h).

An external script is used for low-level discovery of the sensors (as Zabbix currently lacks LLD of IPMI sensors).

## Usage
1. Install the [IPMI sensor discovery script](../Sensor_Discovery).
2. Import the [IPMI Drive Slot Sensors template](../Drive_Slot_Sensors).
3. Import the [IPMI Power Supply Sensors template](../Power_Supply_Sensors).
3. Import the [IPMI Threshold Sensors template](../Threshold_Sensors).
4. Import the
   [`Template_IPMI_Supermicro_SSG-6048R-E1CR24N.xml`](Template_IPMI_Supermicro_SSG-6048R-E1CR24N.xml)
   into your Zabbix server.
5. Add the template to your host (or stack template)
6. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
7. Add an IPMI interface to your host
8. Configure the IPMI parameters of your host
9. Check if new data arrives
