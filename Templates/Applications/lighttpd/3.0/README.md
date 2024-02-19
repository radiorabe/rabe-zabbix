# Zabbix lighttpd monitoring
Basic monitoring of [lighttpd](https://www.lighttpd.net/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_lighttpd_active.xml`](Template_App_lighttpd_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App lighttpd active
Application template for the [lighttpd daemon](https://www.lighttpd.net/).
### Items
* LISTEN state of TCP port {$APP_LIGHTTPD_HTTPS_SERVICE_PORT} (`net.tcp.listen[{$APP_LIGHTTPD_HTTPS_SERVICE_PORT}]`)  
  Listen state of the TCP port {$APP_LIGHTTPD_HTTPS_SERVICE_PORT}
* LISTEN state of TCP port {$APP_LIGHTTPD_HTTP_SERVICE_PORT} (`net.tcp.listen[{$APP_LIGHTTPD_HTTP_SERVICE_PORT}]`)  
  Listen state of the TCP port {$APP_LIGHTTPD_HTTP_SERVICE_PORT}
* CPU utilization (total) of "lighttpd" processes (avg5) in % (`proc.cpu.util[lighttpd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `lighttpd` process.
* Memory usage (rss) of "lighttpd" processes (`proc.mem[lighttpd,,,,rss]`)  
  Memory usage in bytes of the `lighttpd` process.
* Number of "lighttpd" processes (`proc.num[lighttpd]`)  
  Number of running `lighttpd` processes.
### Macros
* `{$APP_LIGHTTPD_HTTPS_SERVICE_PORT}` (default: 443)
* `{$APP_LIGHTTPD_HTTP_SERVICE_PORT}` (default: 80)
### Triggers
* High: No running lighttpd processes on {HOST.NAME}
  ```
  {Template App lighttpd active:proc.num[lighttpd].last(0)}<1
  ```
* High: TCP port {$APP_LIGHTTPD_HTTPS_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App lighttpd active:net.tcp.listen[{$APP_LIGHTTPD_HTTPS_SERVICE_PORT}].last(0)}=0
  ```
* High: TCP port {$APP_LIGHTTPD_HTTP_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App lighttpd active:net.tcp.listen[{$APP_LIGHTTPD_HTTP_SERVICE_PORT}].last(0)}=0
  ```

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
