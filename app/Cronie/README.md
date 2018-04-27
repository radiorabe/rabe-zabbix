# Zabbix Cronie monitoring
Monitoring of the [Cronie](https://github.com/cronie-crond/cronie) cron daemon.

## Usage
1. Import the
   [`Template_App_Cronie_active.xml`](Template_App_Cronie_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App Cronie active
Application template for the [Cronie](https://github.com/cronie-crond/cronie) cron daemon.
### Items
* CPU utilization (total) of "crond" processes (avg5) in % (`proc.cpu.util[crond,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `crond` process.
* Memory usage (rss) of "crond" processes (`proc.mem[crond,,,,rss]`)  
  Memory usage in bytes of the `crond` process.
* Number of "crond" processes (`proc.num[crond]`)  
  Number of running `crond` processes.
### Triggers
* High: No running crond processes on {HOST.NAME}
  ```
  {Template App Cronie active:proc.num[crond].last(0)}<1
  ```
  There are no running `crond` processes on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2018 [Radio Bern RaBe](http://www.rabe.ch)
