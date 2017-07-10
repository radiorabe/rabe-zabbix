## Scripts

* [ipmi-sensor-discovery.sh](./scripts/ipmi-sensor-discovery.sh) Zabbix IPMI sensor low-level discovery

   This script is intended to be used for [Zabbix low-level
   discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery#low-level_discovery)
   of IPMI sensors, as Zabbix currently lacks LLD for IPMI items.

   It uses [FreeIPMI](https://www.gnu.org/software/freeipmi/)'s
   [`ipmi-sensors`](https://www.gnu.org/software/freeipmi/manpages/man8/ipmi-sensors.8.html)
   command to produce a list of available sensors and transforms the output
   into the Zabbix LLD JSON format.
   One is supposed to run this script as an [external
   check](https://www.zabbix.com/documentation/3.0/manual/config/items/itemtypes/external)
   script on a Zabbix server or proxy within a [LLD
   rule](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery#creating_custom_lld_rules).
   The script lists all available sensors of a given IPMI host by default.

   Optionally, the sensor list can be limited to one or multiple (comma
   separated) senor types (see `ipmi-sensors --list-sensor-types`).

   Requirements:
   * `ipmi-sensors` command (usually within the `freeipmi` package of your distribution)
   * GNU `awk` (should already be installed on your system)

   Usage:
   `ipmi-sensor-discovery.sh IPMI-HOST IPMI-USER IPMI-PASSWORD [IPMI-SENSOR-TYPES]`

   LLD macros:
   * `{#IPMI_SENSOR_ID}` - ID of the IPMI sensor
   * `{#IPMI_SENSOR_NAME}` - Name of the IPMI sensor
   * `{#IPMI_SENSOR_TYPE}` - Type of the IPMI sensor
   * `{#IPMI_SENSOR_READING}` - Current sensor value (if appropriate)
   * `{#IPMI_SENSOR_UNITS}` - Sensor units
   * `{#IPMI_SENSOR_LOWER_NR}` - Sensor lower non-recoverable threshold
   * `{#IPMI_SENSOR_LOWER_C}` - Sensor lower critical threshold
   * `{#IPMI_SENSOR_LOWER_NC}` - Sensor lower non-critical threshold
   * `{#IPMI_SENSOR_UPPER_NC}` - Sensor upper non-critical threshold
   * `{#IPMI_SENSOR_UPPER_C}`- Sensor upper critical threshold
   * `{#IPMI_SENSOR_UPPER_NR}`- Sensor upper non-critical threshold
   * `{#IPMI_SENSOR_EVENT}`- Sensor event

   Example output:
   ```json
    {
       "data" : [
          {
             "{#IPMI_SENSOR_ID}" : "205",
             "{#IPMI_SENSOR_NAME}" : "System Temp",
             "{#IPMI_SENSOR_TYPE}" : "Temperature",
             "{#IPMI_SENSOR_READING}" : "26.00",
             "{#IPMI_SENSOR_UNITS}" : "C",
             "{#IPMI_SENSOR_LOWER_NR}" : "-9.00",
             "{#IPMI_SENSOR_LOWER_C}" : "-7.00",
             "{#IPMI_SENSOR_LOWER_NC}" : "-5.00",
             "{#IPMI_SENSOR_UPPER_NC}" : "80.00",
             "{#IPMI_SENSOR_UPPER_C}" : "85.00",
             "{#IPMI_SENSOR_UPPER_NR}" : "90.00",
             "{#IPMI_SENSOR_EVENT}" : "'OK'"
          },
          {
             "{#IPMI_SENSOR_ID}" : "2483",
             "{#IPMI_SENSOR_NAME}" : "FAN1",
             "{#IPMI_SENSOR_TYPE}" : "Fan",
             "{#IPMI_SENSOR_READING}" : "5600.00",
             "{#IPMI_SENSOR_UNITS}" : "RPM",
             "{#IPMI_SENSOR_LOWER_NR}" : "300.00",
             "{#IPMI_SENSOR_LOWER_C}" : "500.00",
             "{#IPMI_SENSOR_LOWER_NC}" : "700.00",
             "{#IPMI_SENSOR_UPPER_NC}" : "25300.00",
             "{#IPMI_SENSOR_UPPER_C}" : "25400.00",
             "{#IPMI_SENSOR_UPPER_NR}" : "25500.00",
             "{#IPMI_SENSOR_EVENT}" : "'OK'"
          },
          {
             "{#IPMI_SENSOR_ID}" : "4627",
             "{#IPMI_SENSOR_NAME}" : "PS1 Status",
             "{#IPMI_SENSOR_TYPE}" : "Power Supply",
             "{#IPMI_SENSOR_READING}" : "N/A",
             "{#IPMI_SENSOR_UNITS}" : "N/A",
             "{#IPMI_SENSOR_LOWER_NR}" : "N/A",
             "{#IPMI_SENSOR_LOWER_C}" : "N/A",
             "{#IPMI_SENSOR_LOWER_NC}" : "N/A",
             "{#IPMI_SENSOR_UPPER_NC}" : "N/A",
             "{#IPMI_SENSOR_UPPER_C}" : "N/A",
             "{#IPMI_SENSOR_UPPER_NR}" : "N/A",
             "{#IPMI_SENSOR_EVENT}" : "'Presence detected'"
          },
       ]
    }
   ```
