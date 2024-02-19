# Zabbix Darkice monitoring
Monitoring of [Darkice](http://www.darkice.org/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Darkice_active.xml`](Template_App_Darkice_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App DarkIce active
Application template for the [DarkIce](http://www.darkice.org/) live audio streamer `darkice`.
### Items
* CPU utilization (total) of "darkice" processes (avg5) in % (`proc.cpu.util[darkice,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `darkice` process.
* Memory usage (rss) of "darkice" processes (`proc.mem[darkice,,,,rss]`)  
  Memory usage in bytes of the `darkice` process.
* Number of "darkice" processes (`proc.num[darkice,,]`)  
  Number of running `darkice` processes.
### Triggers
* High: No running darkice process on {HOST.NAME}
  ```
  {Template App DarkIce active:proc.num[darkice,,].last(0)}<1
  ```
  There is no running `darkice` process on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
