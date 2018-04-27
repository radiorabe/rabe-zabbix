# Zabbix kibana monitoring
Monitoring of [kibana](https://www.elastic.co/products/kibana).

## Usage
1. Import the
   [`Template_App_kibana_active.xml`](Template_App_kibana_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App kibana active
Application template for [kibana](https://www.elastic.co/products/kibana/).
### Items
* LISTEN state of TCP port {$APP_KIBANA_HTTP_SERVICE_PORT} (`net.tcp.listen[{$APP_KIBANA_HTTP_SERVICE_PORT}]`)  
  Listen state of the TCP port {$APP_KIBANA_HTTP_SERVICE_PORT}
* CPU utilization (total) of "node" processes (avg5) in % (`proc.cpu.util[node,kibana,total,,avg5]`)  
  5 minute average CPU utilization in percent of the kibana node process.
* Memory usage (rss) of "node" processes (`proc.mem[node,kibana,,,rss]`)  
  Memory usage in bytes of the kibana node process.
* Number of "node" processes (`proc.num[node,kibana,]`)  
  Number of running kibana `node` processes.
### Macros
* `{$APP_KIBANA_HTTP_SERVICE_PORT}` (default: 5601)
### Triggers
* High: No running kibana node process on {HOST.NAME}
  ```
  {Template App kibana active:proc.num[node,kibana,].last(0)}<1
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
