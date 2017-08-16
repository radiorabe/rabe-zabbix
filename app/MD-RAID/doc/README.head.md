Monitoring of Linux [MD-RAID](https://raid.wiki.kernel.org) devices (aka Linux
Software RAID).

There are [user parameters](#userparameters) with custom [low-level
discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
rules for detecting and monitoring the available array devices (MD) as well as
the underlying component devices (RD). The [sysfs md
interface](https://www.kernel.org/doc/html/latest/admin-guide/md.html#md-devices-in-sysfs)
is used for discovery and monitoring of the device parameters.

## Usage
1. Install the [`rabe.md-raid.conf`](userparameters/rabe.md-raid.conf) Zabbix
   user parameters into your Zabbix agent's
   [`Include`](https://www.zabbix.com/documentation/3.0/manual/appendix/config/zabbix_agentd)
   directory (usually `/etc/zabbix/zabbix_agentd.d`).
4. Import the
   [`Template_App_MD-RAID_active.xml`](Template_App_MD-RAID_active.xml) into
   your Zabbix server.
5. Add the template to you host (or stack template)
6. Check if new data arrives
