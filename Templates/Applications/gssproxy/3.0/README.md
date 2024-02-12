# Zabbix GssProxy Daemon monitoring
Basic monitoring of the [GssProxy Daemon](https://pagure.io/gssproxy).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_GssProxy_Daemon_active.xml`](Template_App_GssProxy_Daemon_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App GssProxy Daemon active
Application template for the [GssProxy Daemon](https://pagure.io/gssproxy) `gssproxy`.
### Items
* CPU utilization (total) of "gssproxy" processes (avg5) in % (`proc.cpu.util[gssproxy,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `gssproxy` process.
* Memory usage (rss) of "gssproxy" processes (`proc.mem[gssproxy,,,,rss]`)  
  Memory usage in bytes of the `gssproxy` process.
* Number of "gssproxy" processes (`proc.num[gssproxy,,]`)  
  Number of running `gssproxy` processes.
### Triggers
* High: No running gssproxy process on {HOST.NAME}
  ```
  {Template App GssProxy Daemon active:proc.num[gssproxy,,].last(0)}<1
  ```
  There is no running `gssproxy` process on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
