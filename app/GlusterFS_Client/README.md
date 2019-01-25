# Zabbix GlusterFS Client monitoring
Monitoring of [GlusterFS Client](https://www.gluster.org/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_GlusterFS_Client_active.xml`](Template_App_GlusterFS_Client_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App GlusterFS Client active
Application template for the [GlusterFS](https://www.gluster.org/) client `glusterfs`.
### Items
* CPU utilization (total) of "glusterfs" processes (avg5) in % (`proc.cpu.util[glusterfs,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `glusterfs` process.
* Memory usage (rss) of "glusterfs" processes (`proc.mem[glusterfs,,,,rss]`)  
  Memory usage in bytes of the `glusterfs` processes.
* Number of "glusterfs" processes (`proc.num[glusterfs]`)  
  Number of running `glusterfs` processes.
### Macros
* `{$APP_GLUSTERFS_CLIENT_MINIMUM_PROCESSES}` (default: 1)
### Triggers
* High: Running glusterfs processes on {HOST.NAME} < $1
  ```
  {Template App GlusterFS Client active:proc.num[glusterfs].last(0)}<{$APP_GLUSTERFS_CLIENT_MINIMUM_PROCESSES}
  ```
  The expected amount of running `glusterfs` processes is not met.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
