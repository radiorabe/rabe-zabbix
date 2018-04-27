# Zabbix BSNMP monitoring
Monitoring of [BSNMP](https://people.freebsd.org/~harti/bsnmp/).

## Usage
1. Import the
   [`Template_App_BSNMP_active.xml`](Template_App_BSNMP_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App BSNMP active
Application template for the [BSNMP daemon](https://people.freebsd.org/~harti/bsnmp/) (mini SNMP daemon).
### Items
* Memory usage (rss) of "bsnmpd" processes (`proc.mem[bsnmpd,,,,rss]`)  
  Memory usage in bytes of the `bsnmpd` process
* Number of "bsnmpd" processes (`proc.num[bsnmpd]`)  
  Number of running `bsnmpd` processes
### Triggers
* High: No running bsnmpd processes on {HOST.NAME}
  ```
  {Template App BSNMP active:proc.num[bsnmpd].last(0)}<1
  ```
  There is no `bsnmpd` process running on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2018 [Radio Bern RaBe](http://www.rabe.ch)
