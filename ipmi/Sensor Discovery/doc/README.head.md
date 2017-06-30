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
4. If you have SELinux active, make sure that the Zabbix-Server is allowed to
   execute the scripts (you might need to load the provided
   [SELinux policy](../selinux/rabezbxsensordiscovery.te)). 
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
