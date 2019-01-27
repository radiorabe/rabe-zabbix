# Zabbix Module Board Generic Sensors monitoring
Monitoring of auto-discovered IPMI Module/Board sensors (sensor type code
`15h`) with generic 'digital' discrete values (reading type code `03h`).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

An external script is used for low-level discovery of the sensors (as Zabbix currently lacks LLD of IPMI sensors).

## Usage

1. Install the [IPMI sensor discovery script](../Sensor_Discovery).
2. Import the [`Template_IPMI_Module_Board_Generic_Sensors.xml`](Template_IPMI_Module_Board_Generic_Sensors.xml)
   template into your Zabbix server (click on the `Raw` button to download).
3. Add the template to your host (or stack template)
4. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
5. Add an IPMI interface to your host
6. Configure the IPMI parameters of your host
7. Check if new data arrives
## Template IPMI Module Board Generic Sensors
IPMI template for Module/Board sensors (sensor type code `15h`) with generic 'digital' discrete values (reading type code `03h`).

The `{$HOST.IPMI.CONN}`, `{$HOST.IPMI.USER}` and `{$HOST.IPMI.PASS}` macros have to be set according to your IPMI configuration.
### Macros
* `{$HOST.IPMI.CONN}` (default: localhost)
* `{$HOST.IPMI.PASS}` (default: password)
* `{$HOST.IPMI.USER}` (default: admin)
* `{$IPMI_MODULE_BOARD_SENSOR_TYPES}` (default: Module_Board)
### Discovery
#### Module/Board IPMI sensor discovery (`ipmi-sensor-discovery.sh["{$HOST.IPMI.CONN}","{$HOST.IPMI.USER}","{$HOST.IPMI.PASS}", "{$IPMI_MODULE_BOARD_SENSOR_TYPES}"]`)
Discovers module/board IPMI sensors with the help of the external ipmi-sensor-discovery.sh script.
##### Item Prototypes
* Sensor $2 (`ipmi.discrete-generic-sensor[module-board,{#IPMI_SENSOR_NAME}]`)  
  IPMI generic 'digital' discrete sensor prototype item for a module/board (sensor type code 15h, reading type code 03h).
##### Trigger Prototypes
* High: Module/Board {#IPMI_SENSOR_NAME} in critical state on {HOST.NAME}
  ```
  {Template IPMI Module Board Generic Sensors:ipmi.discrete-generic-sensor[module-board,{#IPMI_SENSOR_NAME}].band(#1,2)}=2
  ```
  The IPMI module/board 'digital' generic sensor (sensor
type code 15h) is in "State Asserted" (sensor specific offset 01h) state. The second least significant bit = 1 (VALUE & 10 = 10).

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
