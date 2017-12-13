# Zabbix SNMPv2 AVT AE1 DABPlus Go monitoring
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

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template SNMPv2 AVT AE1 DABPlus Go
SNMP template for monitoring [AVT MAGIC AE1 DAB+ Go](http://www.avt-nbg.de/index.php/en/products/dab/encoders/magic-ae1-dab-go) devices based on the `AVT-MIB` and `AVT-AE1-DABPLUS-GO-MIB`.
### Items
* Alarm count reset (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmCountResetTimestamp[]`)  
  Date and time of the last alarm counter reset.
* Clock source (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoClockSource[]`)  
  Device clock source.
* Firmware version (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoFirmwareVersion[]`)  
  Firmware version
* Mainboard DSP1 workload (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoMainboardDsp1Workload[]`)  
  Mainboard DSP1 workload in percent.
* Mainboard temperature (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoMainboardTemperature[]`)  
  Mainboard temperature in Degree Celsius.
### Macros
* `{$SNMP_COMMUNITY}` (default: public)
### Discovery
#### Alarms (`rabe.snmp.avt-ae1-dabplus-go.alarm.discovery`)
Discovery of Alarms

Returns the following macro for each available Alarm
* `{#ALARM_NAME}`
  * Alarm name (`AVT-AE1-DABPLUS-GO-MIB::amae1dabpgoAlarmName`).
##### Item Prototypes
* Block counter of alarm "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmBlockCount[{#ALARM_NAME}]`)  
  Alarm block counter. Number of state changes to True during the throttle interval. This counter is cleared when the corresponding notification has been issued.
* Count of alarm "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmCount[{#ALARM_NAME}]`)  
  Alarm counter. Changes of the state to True.
* State of alarm "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmState[{#ALARM_NAME}]`)  
  Alarm state.
* Timestamp of alarm "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmTimestamp[{#ALARM_NAME}]`)  
  Alarm timestamp. Date and time of the last state change.
##### Trigger Prototypes
* High: "{#ALARM_NAME}" alarm on {HOST.NAME}
  ```
  {Template SNMPv2 AVT AE1 DABPlus Go:rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoAlarmState[{#ALARM_NAME}].last()}<>2
  ```
  The `{#ALARM_NAME}`  alarm's state has fired (is not `false`).
#### Encoders (`rabe.snmp.avt-ae1-dabplus-go.encoder.discovery`)
Discovery of encoders

Returns the following macro for each available encoder
* `{#ENCODER_STATE}`
  * Status information about the current operation (`AVT-AE1-DABPLUS-GO-MIB::amae1dabpgoEncoderState`).
* `{#ENCODER_ONAIR}`
  * On-air status information (`AVT-AE1-DABPLUS-GO-MIB::amae1dabpgoEncoderOnAir`).
##### Item Prototypes
* Algorithm of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderAlgorithm[{#SNMPINDEX}]`)  
  Coding algorithm.
* Audio mode of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderAudioMode[{#SNMPINDEX}]`)  
  Audio mode.
* Left audio level of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderLvlLeft[{#SNMPINDEX}]`)  
  Left audio level in dBFS.
* Right audio level of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderLvlRight[{#SNMPINDEX}]`)  
  Right audio level in dBFS.
* On-air status of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderOnAir[{#SNMPINDEX}]`)  
  On-air status information.
* Pad rate of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderPadRate[{#SNMPINDEX}]`)  
  PAD rate in Bit/s.
* Sampling frequency of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderSamplFreq[{#SNMPINDEX}]`)  
  Sampling frequency in Hz.
* State of encoder "$1" (`rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderState[{#SNMPINDEX}]`)  
  Status information about the current operation.
##### Trigger Prototypes
* High: Encoder "{#SNMPINDEX}"  is not in running state ({ITEM.VALUE1}) on {HOST.NAME}
  ```
  {Template SNMPv2 AVT AE1 DABPlus Go:rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderState[{#SNMPINDEX}].last()}<>2
  ```
  The encoder "`{#SNMPINDEX}`" is not in `running(2)` state on this device.
* High: Encoder "{#SNMPINDEX}"  is not on-air on {HOST.NAME}
  ```
  {Template SNMPv2 AVT AE1 DABPlus Go:rabe.snmp.avt-ae1-dabplus-go.amae1dabpgoEncoderOnAir[{#SNMPINDEX}].last()}<>1
  ```
  The encoder "`{#SNMPINDEX}`" on-air status is not in `true(1)` on this device.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
