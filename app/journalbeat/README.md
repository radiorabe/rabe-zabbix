# Zabbix journalbeat monitoring
Monitoring of [journalbeat](https://github.com/mheese/journalbeat).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_journalbeat_active.xml`](Template_App_journalbeat_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Journalbeat active
Application template for [Journalbeat](https://github.com/mheese/journalbeat/).
### Items
* CPU utilization (total) of "journalbeat" processes (avg5) in % (`proc.cpu.util[journalbeat,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the journalbeat process.
* Memory usage (rss) of "journalbeat" processes (`proc.mem[journalbeat,,,,rss]`)  
  Memory usage in bytes of the journalbeat process.
* Number of "journalbeat" processes (`proc.num[journalbeat,,]`)  
  Number of running `journalbeat` processes.
### Triggers
* High: No running journalbeat process on {HOST.NAME}
  ```
  {Template App Journalbeat active:proc.num[journalbeat,,].last(0)}<1
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
