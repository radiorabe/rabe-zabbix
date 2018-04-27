# Zabbix elasticsearch monitoring
Monitoring of [elasticsearch](https://www.elastic.co/).

## Usage
1. Import the
   [`Template_App_elasticsearch_active.xml`](Template_App_elasticsearch_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App elasticsearch active
Application template for [elasticsearch](https://www.elastic.co/).
### Items
* CPU utilization (total) of "java" processes (avg5) in % (`proc.cpu.util[java,elasticsearch,total,,avg5]`)  
  5 minute average CPU utilization in percent of the elasticsearch java process.
* Memory usage (rss) of "java" processes (`proc.mem[java,elasticsearch,,,rss]`)  
  Memory usage in bytes of the elasticsearch java process.
* Number of "java" processes (`proc.num[java,elasticsearch,]`)  
  Number of running elasticsearch `java` processes.
### Triggers
* High: No running elasticsearch java process on {HOST.NAME}
  ```
  {Template App elasticsearch active:proc.num[java,elasticsearch,].last(0)}<1
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
