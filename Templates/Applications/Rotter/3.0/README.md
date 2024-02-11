# Zabbix Rotter monitoring
Monitoring for [Rotter](https://www.aelius.com/njh/rotter/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Rotter_active.xml`](Template_App_Rotter_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Rotter active
Application template for [Rotter](http://www.aelius.com/njh/rotter/), a Recording of Transmission / Audio Logger for JACK.
### Items
* CPU utilization (total) of "rotter" processes (avg5) in % (`proc.cpu.util[rotter,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `rotter` process.
* Memory usage (rss) of "rotter" processes (`proc.mem[rotter,,,,rss]`)  
  The RSS memory usage of the `rotter` process
* Number of "rotter" processes (`proc.num[rotter]`)  
  The number of running `rotter` processes.
### Triggers
* High: No running rotter processes on {HOST.NAME}
  ```
  {Template App Rotter active:proc.num[rotter].last(0)}<1
  ```
  There is no running `rotter` process (Recording of Transmission / Audio Logger for JACK) on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
