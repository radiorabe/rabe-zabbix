# Zabbix auditd monitoring
Monitoring of [auditd](https://people.redhat.com/sgrubb/audit/).

## Usage
1. Import the
   [`Template_App_auditd_active.xml`](Template_App_auditd_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_auditd_active.xml`](Template_App_auditd_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App auditd active
Application template for the [Linux Audit daemon](https://people.redhat.com/sgrubb/audit/) `auditd`.
### Items
* CPU utilization (total) of "auditd" processes (avg5) in % (`proc.cpu.util[auditd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the auditd process.
* Memory usage (rss) of "auditd" processes (`proc.mem[auditd,,,,rss]`)  
  Memory usage in bytes of the auditd process.
* Number of "auditd" processes (`proc.num[auditd,,]`)  
  Number of running `auditd` processes.
### Triggers
* High: No running auditd process on {HOST.NAME}
  ```
  {Template App auditd active:proc.num[auditd,,].last(0)}<1
  ```
  There is no running `auditd` process on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
