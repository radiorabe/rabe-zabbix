Monitoring the [Common Address Redundancy Protocol (CARP)](https://www.freebsd.org/doc/handbook/carp.html) on FreeBSD systems.

There are custom [low-level discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
rules for detecting all the configured Virtual Host IDs (VHID) and virtual IP
addresses as well as user parameters for monitoring the current status of VHIDs
and VIPs.  Refer to the
[CARP(4)](https://www.freebsd.org/cgi/man.cgi?query=carp&amp;sektion=4) man page
for more information regarding CARP.

The discovery rules and user parameters were tested on
[pfSense](http://pfsense.org/) based systems but should work on all
[FreeBSD](https://www.freebsd.org) 10 and later systems.
