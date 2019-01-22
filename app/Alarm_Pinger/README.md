# Zabbix Alarm Pinger monitoring
Monitoring of [Alarm Pinger](https://github.com/Jajcus/apinger).

## Usage
1. Import the
   [`Template_App_Alarm_Pinger_active.xml`](Template_App_Alarm_Pinger_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Alarm_Pinger_active.xml`](Template_App_Alarm_Pinger_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Alarm Pinger active
Application template for the [Alarm Pinger](https://github.com/Jajcus/apinger) (`apinger`) daemon.
### Items
* Memory usage (rss) of "apinger" processes (`proc.mem[apinger,,,,rss]`)  
  Memory usage in bytes of the `apinger` process
* Number of "apinger" processes (`proc.num[apinger]`)  
  Number of running `apinger` processes
### Triggers
* High: No running apinger processes on {HOST.NAME}
  ```
  {Template App Alarm Pinger active:proc.num[apinger].last(0)}<1
  ```
  There is no running `apinger` process on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
