# Zabbix Supermicro SSG-6048R-E1CR24N monitoring
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

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template IPMI Supermicro SSG-6048R-E1CR24N
IPMI template for Supermicro SuperStorage Server [6048R-E1CR24N](https://www.supermicro.com/products/system/4u/6048/ssg-6048r-e1cr24n.cfm)

The `{$HOST.IPMI.CONN}`, `{$HOST.IPMI.USER}` and `{$HOST.IPMI.PASS}` macros have to be set according to your IPMI configuration.
### Macros
* `{$HOST.IPMI.CONN}` (default: localhost)
* `{$HOST.IPMI.PASS}` (default: password)
* `{$HOST.IPMI.USER}` (default: admin)

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
