# Zabbix libvirtd monitoring
Monitoring of [libvirtd](https://libvirt.org/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_libvirtd_active.xml`](Template_App_libvirtd_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App libvirtd active
Application template for [libvirtd management daemon](https://libvirt.org/).
### Items
* CPU utilization (total) of "libvirtd" processes (avg5) in % (`proc.cpu.util[libvirtd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `libvirtd` process.
* Memory usage (rss) of "libvirtd" processes (`proc.mem[libvirtd,,,,rss]`)  
  Memory usage in bytes of the `libvirtd` process.
* Number of "libvirtd" processes (`proc.num[libvirtd]`)  
  Number of running `libvirtd` processes.
### Triggers
* High: No running libvirtd processes on {HOST.NAME}
  ```
  {Template App libvirtd active:proc.num[libvirtd].last(0)}<1
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
