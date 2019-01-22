# Zabbix GlusterFS Server monitoring
Monitoring of [GlusterFS Server](https://www.gluster.org/).

## Usage
1. Import the
   [`Template_App_GlusterFS_Server_active.xml`](Template_App_GlusterFS_Server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_GlusterFS_Server_active.xml`](Template_App_GlusterFS_Server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App GlusterFS Server active
Application template for the [GlusterFS](https://www.gluster.org/) server `glusterfsd`.
### Items
* CPU utilization (total) of "glusterfsd" processes (avg5) in % (`proc.cpu.util[glusterfsd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `glusterfsd` process.
* Memory usage (rss) of "glusterfsd" processes (`proc.mem[glusterfsd,,,,rss]`)  
  Memory usage in bytes of the `glusterfsd` processes.
* Number of "glusterfsd" processes (`proc.num[glusterfsd]`)  
  Number of running `glusterfsd` processes.
### Triggers
* High: No running glusterfsd processes on {HOST.NAME}
  ```
  {Template App GlusterFS Server active:proc.num[glusterfsd].last(0)}<1
  ```
  There is no `glusterfsd` process running on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
