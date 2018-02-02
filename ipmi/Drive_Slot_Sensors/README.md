# Zabbix Drive Slot Sensors monitoring
Monitoring of auto-discovered IPMI drive slot sensors (sensor type code `0Dh`).

An external script is used for low-level discovery of the sensors (as Zabbix currently lacks LLD of IPMI sensors).

## Usage
1. Install the [IPMI sensor discovery script](../Sensor_Discovery).
2. Import the [`Template_IPMI_Drive
   Slot_Sensors.xml`](Template_IPMI_Drive_Slot_Sensors.xml) into your Zabbix
   server.
3. Add the template to your host (or stack template)
4. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
5. Add an IPMI interface to your host
6. Configure the IPMI parameters of your host
7. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template IPMI Drive Slot Sensors
IPMI template for drive slots sensors (sensor type code 0Dh) with sensor-specific discrete values (reading type 6Fh).

The {$HOST.IPMI.CONN}, {$HOST.IPMI.USER} and {$HOST.IPMI.PASS} macros have to be set according to your IPMI configuration.
### Macros
* `{$HOST.IPMI.CONN}` (default: localhost)
* `{$HOST.IPMI.PASS}` (default: password)
* `{$HOST.IPMI.USER}` (default: admin)
* `{$IPMI_DRIVE_SLOT_SENSOR_TYPES}` (default: Drive_Slot)
### Discovery
#### Drive slot IPMI sensor discovery (`ipmi-sensor-discovery.sh["{$HOST.IPMI.CONN}","{$HOST.IPMI.USER}","{$HOST.IPMI.PASS}", "{$IPMI_DRIVE_SLOT_SENSOR_TYPES}"]`)
Discovers drive slot IPMI sensors with the help of the external ipmi-sensor-discovery.sh script.
##### Item Prototypes
* Sensor $2 (`ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}]`)  
  IPMI discrete sensor prototype item for a drive slot (sensor type code 0Dh).
##### Trigger Prototypes
* Warning: Drive slote {#IPMI_SENSOR_NAME} predictive failure on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,4)}=4
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "Predictive Failure" (sensor specific offset 02h) state. The third least significant bit is 1 (VALUE & 100 = 100).
* Information: Drive slot {#IPMI_SENSOR_NAME} consistency check in progress on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,16)}=16
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "Consistency Check / Parity Check in progress" (sensor specific offset 04h) state. The 	fifth least significant bit is 1 (VALUE & 10000 = 10000).
* High: Drive slot {#IPMI_SENSOR_NAME} drive fault on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,2)}=2
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "Drive Fault" (sensor specific offset 01h) state. The second least significant bit = 1 (VALUE & 10 = 10).
* Warning: Drive slot {#IPMI_SENSOR_NAME} in critical array on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,32)}=32
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "In Critical Array" (sensor specific offset 05h) state. The sixth least significant bit is 1 (VALUE & 100000 = 100000).
* High: Drive slot {#IPMI_SENSOR_NAME} in failed array on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,64)}=64
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "In Failed Array" (sensor specific offset 06h) state. The seventh least significant bit is 1 (VALUE & 1000000 = 1000000).
* Warning: Drive slot {#IPMI_SENSOR_NAME} rebuild aborted on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,256)}=256
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "Rebuild/Remap Aborted (was not completed normally)" (sensor specific offset 08h) state. The ninth least significant bit is 1 (VALUE & 100000000 = 100000000).
* Information: Drive slot {#IPMI_SENSOR_NAME} rebuild in progress on {HOST.NAME}
  ```
  {Template IPMI Drive Slot Sensors:ipmi.discrete-sensor[drive-slot,{#IPMI_SENSOR_NAME}].band(#1,128)}=128
  ```
  The IPMI drive slot sensor (sensor
type code 0Dh) is in "Rebuild/Remap in progress" (sensor specific offset 07h) state. The eighth least significant bit is 1 (VALUE & 10000000 = 10000000).

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
