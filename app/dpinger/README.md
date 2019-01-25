# Zabbix dpinger monitoring
Monitoring of [dpinger](https://github.com/dennypage/dpinger).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_dpinger_active.xml`](Template_App_dpinger_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App dpinger active
Application template for the [dpinger](https://github.com/dennypage/dpinger) daemon.
### Items
* Memory usage (rss) of "dpinger" processes (`proc.mem[dpinger,,,,rss]`)  
  Memory usage in bytes of the dpinger process
* Number of "dpinger" processes (`proc.num[dpinger]`)  
  Number of running dpinger processes
### Triggers
* High: No running dpinger processe on {HOST.NAME}
  ```
  {Template App dpinger active:proc.num[dpinger].last(0)}<1
  ```
  There is no `dpinger` process running on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
