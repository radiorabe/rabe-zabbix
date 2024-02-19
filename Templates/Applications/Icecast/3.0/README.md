# Zabbix Icecast monitoring
Basic monitoring of [Icecast](http://www.icecast.org).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Icecast_active.xml`](Template_App_Icecast_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Icecast active
Application template for the [Icecast server](http://www.icecast.org).
### Items
* LISTEN state of TCP port {$APP_ICECAST_HTTPS_SERVICE_PORT} (`net.tcp.listen[{$APP_ICECAST_HTTPS_SERVICE_PORT}]`)  
  The TCP listen status of the Icecast HTTPS service.
* LISTEN state of TCP port {$APP_ICECAST_HTTP_SERVICE_PORT} (`net.tcp.listen[{$APP_ICECAST_HTTP_SERVICE_PORT}]`)  
  The TCP listen status of the Icecast HTTP service.
* Status of TCP connection to {$APP_ICECAST_HTTPS_SERVICE_IP}:{$APP_ICECAST_HTTPS_SERVICE_PORT} (`net.tcp.port[{$APP_ICECAST_HTTPS_SERVICE_IP},{$APP_ICECAST_HTTPS_SERVICE_PORT}]`)  
  The status of the TCP connection to the Icecast HTTPS service.
* Status of TCP connection to {$APP_ICECAST_HTTP_SERVICE_IP}:{$APP_ICECAST_HTTP_SERVICE_PORT} (`net.tcp.port[{$APP_ICECAST_HTTP_SERVICE_IP},{$APP_ICECAST_HTTP_SERVICE_PORT}]`)  
  The status of the TCP connection to the Icecast HTTP service.
* CPU utilization (total) of "icecast" processes (avg5) in % (`proc.cpu.util[icecast,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `icecast` process.
* Memory usage (rss) of "icecast" processes (`proc.mem[icecast,,,,rss]`)  
  The RSS memory usage of the `icecast` process
* Number of "icecast" processes (`proc.num[icecast]`)  
  The number of running `icecast` processes.
### Macros
* `{$APP_ICECAST_HTTPS_BASE_URL}` (default: https://icecast.example.com:8443)
* `{$APP_ICECAST_HTTPS_SERVICE_IP}` (default: 127.0.0.1)
* `{$APP_ICECAST_HTTPS_SERVICE_PORT}` (default: 8443)
* `{$APP_ICECAST_HTTP_BASE_URL}` (default: http://icecast.example.com:8000)
* `{$APP_ICECAST_HTTP_SERVICE_IP}` (default: 127.0.0.1)
* `{$APP_ICECAST_HTTP_SERVICE_PORT}` (default: 8000)
* `{$APP_ICECAST_PUBLIC_HOME_PATH}` (default: /status.xsl)
### Triggers
* High: Icecast HTTP service is down on {HOST.NAME} {$APP_ICECAST_HTTP_SERVICE_IP}:{$APP_ICECAST_HTTP_SERVICE_PORT}
  ```
  {Template App Icecast active:net.tcp.port[{$APP_ICECAST_HTTP_SERVICE_IP},{$APP_ICECAST_HTTP_SERVICE_PORT}].last(0)}=0
  ```
  TCP connections to the Icecast HTTP service are not possible.
* High: Icecast HTTPS service is down on {HOST.NAME} {$APP_ICECAST_HTTPS_SERVICE_IP}:{$APP_ICECAST_HTTPS_SERVICE_PORT}
  ```
  {Template App Icecast active:net.tcp.port[{$APP_ICECAST_HTTPS_SERVICE_IP},{$APP_ICECAST_HTTPS_SERVICE_PORT}].last(0)}=0
  ```
  TCP connections to the Icecast HTTPS service are not possible.
* High: No running icecast processes on {HOST.NAME}
  ```
  {Template App Icecast active:proc.num[icecast].last(0)}<1
  ```
  There is no running `icecast` process on this host.
* High: TCP port {$APP_ICECAST_HTTPS_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Icecast active:net.tcp.listen[{$APP_ICECAST_HTTPS_SERVICE_PORT}].last(0)}=0
  ```
  The Icecast HTTPS service TCP port is not in listen state.
* High: TCP port {$APP_ICECAST_HTTP_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Icecast active:net.tcp.listen[{$APP_ICECAST_HTTP_SERVICE_PORT}].last(0)}=0
  ```
  The Icecast HTTP service TCP port is not in listen state.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
