# Zabbix Sensor Discovery monitoring
Zabbix low-level discovery of IPMI sensors, including their types, units and
thresholds.

This is not an actual Zabbix template, but rather an [external
check](https://www.zabbix.com/documentation/3.0/manual/config/items/itemtypes/external)
script for [low-level
discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
of IPMI sensors (as Zabbix currently lacks LLD for IPMI sensors). The script is
required by most of the [IPMI templates](../../).

## Usage
1. Install the
   [`ipmi-sensors`](https://www.gnu.org/software/freeipmi/manpages/man8/ipmi-sensors.8.html)
   command from the [FreeIPMI project](https://www.gnu.org/software/freeipmi/),
   which can usually be found within the `freeipmi` package of your
   distribution.
2. Copy the [`ipmi-sensor-discovery.sh`](../scripts/ipmi-sensor-discovery.sh)
   script into your Zabbix servers/proxy external script directory
   ([`ExternalScripts`](https://www.zabbix.com/documentation/3.0/manual/appendix/config/zabbix_server)).
3. Make sure the script is executable by the user running the zabbix-server
4. If you have SELinux active, ensure that the Zabbix server is allowed to
   execute the script and is allowed to operate on directories and files within
   its home directory (this is required for accessing the cache directory of
   the `ipmi-sensor` command, located at `~/.freeipmi/).
   On CentOS 7 the following steps were necessary:
   ```bash
   # Create the missing home directory of the zabbix user
   mkdir -m 750 /var/lib/zabbix
   chown zabbix:zabbix /var/lib/zabbix

   # Restore default SELinux security context on the directory.
   # This will set the following SELinux context on /var/lib/zabbix
   # => unconfined_u:object_r:zabbix_var_lib_t:s0
   restorecon -Rv /var/lib/zabbix
   ```
5. Reference the script within Zabbix by either
   * creating a new custom LLD rule (external check), item and trigger prototypes
   * importing an existing [IPMI template](../../) and add it to your host (or
    stack template)
6. Set the following user macros on your host or template (those are required
   for the auto discovery to work)
   * `{$HOST.IPMI.CONN}` IP address or domain name of your IPMI host
   * `{$HOST.IPMI.USER}` IPMI user
   * `{$HOST.IPMI.PASS}` IPMI password
7. Add an IPMI interface to your host
8. Configure the IPMI parameters of your host
9. Check if new data arrives

### Low-level discovery rule example:
1. Navigate to `Configure / Templates / <YOUR TEMPLATE>`
2. Under `Discovery rule` create a similar rule as below

|      |     |
| ---  | --- |
| Name | `Fan and Temperature IPMI sensor discovery` |
| Type | `External check [v]` |
| Key  | `ipmi-sensor-discovery.sh["{$HOST.IPMI.CONN}","{$HOST.IPMI.USER}","{$HOST.IPMI.PASS}", "Temperature,Fan"]` |

## Notes
### Commands for debugging
The following commands might be helpful for debugging:

```bash
# read all sensors using the ipmi-sensors command
ipmi-sensors -D LAN -h <IPMI-HOST> -u <IPMI-USER> -p <IPMI-PASSWORD> -l USER 

# Get the Zabbix LLD JSON output for the sensors
ipmi-sensor-discovery.sh <IPMI-HOST> <IPMI-USER> <IPMI-PASSWORD>

# Manually remove the FreeIPMI SDR cache
rm -rf ~zabbix/.freeipmi-zabbix/
```

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template IPMI Sensor Discovery
This is just an empty IPMI Sensor discovery dummy template, required for documentation generation. There's no need to install it.
## Scripts

* [ipmi-sensor-discovery.sh](./scripts/ipmi-sensor-discovery.sh) Zabbix IPMI sensor low-level discovery

   This script is intended to be used for [Zabbix low-level
   discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery#low-level_discovery)
   of IPMI sensors, as Zabbix currently lacks LLD for IPMI items.

   It uses the [FreeIPMI](https://www.gnu.org/software/freeipmi/)
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
             "{#IPMI_SENSOR_EVENT}" : "OK"
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
             "{#IPMI_SENSOR_EVENT}" : "OK"
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
             "{#IPMI_SENSOR_EVENT}" : "Presence detected"
          },
       ]
    }
   ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
