# Zabbix Threshold Sensors monitoring
Monitoring of auto-discovered IPMI threshold sensors (Temperature, Voltage,
Current and Fan types).

An external script is used for low-level discovery of the sensors (as Zabbix
currently lacks LLD of IPMI sensors).

Triggers will be created for each discovered sensor, according to their
advertised lower and upper non-critical, critical and non-recoverable
thresholds.

## Usage
1. Install the [IPMI sensor discovery script](../../Sensor_Discovery).
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

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template IPMI Threshold Sensors
IPMI template for thresold based sensors. Currently supported sensors are current, fan, temperature and voltage.

The {$HOST.IPMI.CONN}, {$HOST.IPMI.USER} and {$HOST.IPMI.PASS} macros have to be set according to your IPMI configuration.
### Macros
* `{$HOST.IPMI.CONN}` (default: localhost)
* `{$HOST.IPMI.PASS}` (default: password)
* `{$HOST.IPMI.USER}` (default: admin)
* `{$IPMI_THRESHOLD_SENSOR_TYPES}` (default: Temperature,Voltage,Current,Fan)
### Discovery
#### Threshold based IPMI sensor discovery (`ipmi-sensor-discovery.sh["{$HOST.IPMI.CONN}","{$HOST.IPMI.USER}","{$HOST.IPMI.PASS}", "{$IPMI_THRESHOLD_SENSOR_TYPES}"]`)
Discovers threshold based IPMI sensors (such as Temperature, Fan, Voltage and Current) with the help of the external ipmi-sensor-discovery.sh script.
##### Item Prototypes
* Sensor $1 (`ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}]`)  
  IPMI threshold sensor prototype item
##### Trigger Prototypes
* High: Sensor {#IPMI_SENSOR_NAME} below critical threshold ({ITEM.VALUE1}  < {#IPMI_SENSOR_LOWER_C}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}<{#IPMI_SENSOR_LOWER_C}
  ```
  The IPMI sensor has fallen below it's defined lower critical threshold.
* Warning: Sensor {#IPMI_SENSOR_NAME} below non-critical threshold ({ITEM.VALUE1}  < {#IPMI_SENSOR_LOWER_NC}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}<{#IPMI_SENSOR_LOWER_NC}
  ```
  The IPMI sensor has fallen below it's defined lower non-critical threshold.
* High: Sensor {#IPMI_SENSOR_NAME} exceeded critical threshold ({ITEM.VALUE1}  > {#IPMI_SENSOR_UPPER_C}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}>{#IPMI_SENSOR_UPPER_C}
  ```
  The IPMI sensor has exceeded it's defined upper critical threshold.
* Warning: Sensor {#IPMI_SENSOR_NAME} exceeded non-critical threshold ({ITEM.VALUE1}  > {#IPMI_SENSOR_UPPER_NC}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}>{#IPMI_SENSOR_UPPER_NC}
  ```
  The IPMI sensor has exceeded it's defined upper non-critical threshold.
* High: Sensor {#IPMI_SENSOR_NAME} reached non-recoverable threshold ({ITEM.VALUE1}  <= {#IPMI_SENSOR_LOWER_NR}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}<={#IPMI_SENSOR_LOWER_NR}
  ```
  The IPMI sensor has reached it's defined lower non-recoverable threshold.
* High: Sensor {#IPMI_SENSOR_NAME} reached non-recoverable threshold ({ITEM.VALUE1} >= {#IPMI_SENSOR_UPPER_NR}) on {HOST.NAME}
  ```
  {Template IPMI Threshold Sensors:ipmi.threshold-sensor[{#IPMI_SENSOR_NAME}].last()}>={#IPMI_SENSOR_UPPER_NR}
  ```
  The IPMI sensor has reached it's defined upper non-recoverable threshold.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
