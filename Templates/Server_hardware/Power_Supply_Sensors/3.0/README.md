# Zabbix Power Supply Sensors monitoring
Monitoring of auto-discovered IPMI power supplies sensors (sensor type code
`08h`) with sensor-specific discrete values (reading type `6Fh`).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

An external script is used for low-level discovery of the sensors (as Zabbix currently lacks LLD of IPMI sensors).

## Usage

1. Install the [IPMI sensor discovery script](../Sensor_Discovery).
2. Import the [`Template_IPMI_Power_Supply_Sensors.xml`](Template_IPMI_Power_Supply_Sensors.xml)
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
## Template IPMI Power Supply Sensors
IPMI template for power supplies sensors (sensor type code `08h`) with sensor-specific discrete values (reading type `6Fh`).

The `{$HOST.IPMI.CONN}`, `{$HOST.IPMI.USER}` and `{$HOST.IPMI.PASS}` macros have to be set according to your IPMI configuration.
### Macros
* `{$HOST.IPMI.CONN}` (default: localhost)
* `{$HOST.IPMI.PASS}` (default: password)
* `{$HOST.IPMI.USER}` (default: admin)
* `{$IPMI_POWER_SUPPLY_SENSOR_TYPES}` (default: Power_Supply)
### Discovery
#### Power supply IPMI sensor discovery (`ipmi-sensor-discovery.sh["{$HOST.IPMI.CONN}","{$HOST.IPMI.USER}","{$HOST.IPMI.PASS}", "{$IPMI_POWER_SUPPLY_SENSOR_TYPES}"]`)
Discovers power supply IPMI sensors with the help of the external ipmi-sensor-discovery.sh script.
##### Item Prototypes
* Sensor $2 (`ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}]`)  
  IPMI discrete sensor prototype item for a power supply (sensor type code `08h`).
##### Trigger Prototypes
* High: Power supply {#IPMI_SENSOR_NAME} failure detected on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,2)}=2
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Power Supply Failure detected" (sensor specific offset 01h) state. The second least significant bit = 1 (VALUE & 10 = 10).
* High: Power supply {#IPMI_SENSOR_NAME} has a configuration error on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,64)}=64
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Configuration error" (sensor specific offset 06h) state. The seventh least significant bit is 1 (VALUE & 1000000 = 1000000).
* High: Power supply {#IPMI_SENSOR_NAME} input lost (AC/DC) on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,8)}=8
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Power Supply input lost (AC/DC)" (sensor specific offset 03h) state. The 	fourth least significant bit is 1 (VALUE & 1000 = 1000).
* High: Power supply {#IPMI_SENSOR_NAME} input lost or out-of-range on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,16)}=16
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Power Supply input lost or out-of-range" (sensor specific offset 04h) state. The 	fifth least significant bit is 1 (VALUE & 10000 = 10000).
* High: Power supply {#IPMI_SENSOR_NAME} input out-of-range, but present on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,32)}=32
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Power Supply input out-of-range, but present" (sensor specific offset 05h) state. The sixth least significant bit is 1 (VALUE & 100000 = 100000).
* Warning: Power supply {#IPMI_SENSOR_NAME} predictive failure on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,4)}=4
  ```
  The IPMI power supply sensor (sensor
type code 08h) is in "Predictive Failure" (sensor specific offset 02h) state. The third least significant bit is 1 (VALUE & 100 = 100).
* High: Power supply {#IPMI_SENSOR_NAME} presence not detected on {HOST.NAME}
  ```
  {Template IPMI Power Supply Sensors:ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}].band(#1,1)}<>1
  ```
  The IPMI power supply sensor (sensor
type code 08h) is not in "Presence detected" (sensor specific offset 00h) state. The least significant bit is not 1 (VALUE & 1 = 0). This trigger serves as a safety catch-all for unknown states or IPMI implementation bugs.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
