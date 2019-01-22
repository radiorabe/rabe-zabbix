# Zabbix chrony monitoring
Basic chrony NTP client monitoring.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_chrony_active.xml`](Template_App_chrony_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App chrony active
### Items
* Memory usage (rss) of "chronyd" processes (`proc.mem[chronyd,chrony,,,rss]`)  
* Number of "chronyd" processes (`proc.num[chronyd,chrony]`)  
### Triggers
* High: No running chronyd processes on {HOST.NAME}
  ```
  {Template App chrony active:proc.num[chronyd,chrony].max(#5)}<1
  ```
  We expect chronyd to to run at all times

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
