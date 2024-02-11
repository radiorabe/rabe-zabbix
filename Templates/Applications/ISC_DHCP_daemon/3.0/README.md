# Zabbix ISC DHCP daemon monitoring
Basic monitoring of the [ISC DHCP daemon](https://www.isc.org/downloads/dhcp/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_ISC_DHCP_daemon_active.xml`](Template_App_ISC_DHCP_daemon_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App ISC DHCP Daemon active
Application template for the [ISC DHCP daemon](https://www.isc.org/downloads/dhcp/).
### Items
* CPU utilization (total) of "dhcpd" processes (avg5) in % (`proc.cpu.util[dhcpd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `dhcpd` process.
* Memory usage (rss) of "dhcpd" processes (`proc.mem[dhcpd,,,,rss]`)  
  Memory usage in bytes of the `dhcpd` process.
* Number of "dhcpd" processes (`proc.num[dhcpd]`)  
  Number of running dhcpd processes
### Triggers
* High: No running dhcpd processes on {HOST.NAME}
  ```
  {Template App ISC DHCP Daemon active:proc.num[dhcpd].last(0)}<1
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
