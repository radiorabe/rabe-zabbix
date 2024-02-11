# Zabbix ISC DHCP Relay Agent monitoring
Basic monitoring of the [ISC DHCP relay agent](https://www.isc.org/downloads/dhcp/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_ISC_DHCP_Relay_Agent_active.xml`](Template_App_ISC_DHCP_Relay_Agent_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App ISC DHCP Relay Agent active
Application template for the [ISC DHCP Relay Agent](https://www.isc.org/downloads/dhcp/).
### Items
* CPU utilization (total) of "dhcrelay" processes (avg5) in % (`proc.cpu.util[dhcrelay,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `dhcrelay` process.
* Memory usage (rss) of "dhcrelay" processes (`proc.mem[dhcrelay,,,,rss]`)  
  Memory usage in bytes of the `dhcrelay` process.
* Number of "dhcrelay" processes (`proc.num[dhcrelay]`)  
  Number of running `dhcrelay` processes.
### Triggers
* High: No running dhcrelay processes on {HOST.NAME}
  ```
  {Template App ISC DHCP Relay Agent active:proc.num[dhcrelay].last(0)}<1
  ```
  There is no `dhcrelay` process running.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
