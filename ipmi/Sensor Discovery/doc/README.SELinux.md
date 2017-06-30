## SELinux Policy

The [rabezbxsensordiscovery](selinux/rabezbxsensordiscovery.te) policy allows
the Zabbix server (via an [external
check](https://www.zabbix.com/documentation/3.0/manual/config/items/itemtypes/external)
command) to manage
[`ipmi-sensors`](https://www.gnu.org/software/freeipmi/manpages/man8/ipmi-sensors.8.html)'s
SDR cache located at `/tmp/.freeipmi-zabbix/.freeipmi/sdr-cache`.
