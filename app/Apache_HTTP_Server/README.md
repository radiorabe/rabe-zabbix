# Zabbix Apache HTTP Server monitoring
Basic monitoring of [Apache HTTP Server](http://httpd.apache.org/).

## Usage
1. Import the
   [`Template_App_Apache_HTTP_Server_active.xml`](Template_App_Apache_HTTP_Server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Apache_HTTP_Server_active.xml`](Template_App_Apache_HTTP_Server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Apache HTTP Server active
Application template for the [Apache HTTP server](http://httpd.apache.org/).
### Items
* LISTEN state of TCP port {$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT} (`net.tcp.listen[{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}]`)  
  The TCP listen status of the Apache HTTP server HTTPS service.
* LISTEN state of TCP port {$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT} (`net.tcp.listen[{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}]`)  
  The TCP listen status of the Apache HTTP server HTTP service.
* Status of TCP connection to {$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_IP}:{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT} (`net.tcp.port[{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_IP},{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}]`)  
  The status of the TCP connection to the Apache HTTP Server HTTPS service.
* Status of TCP connection to {$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_IP}:{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT} (`net.tcp.port[{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_IP},{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}]`)  
  The status of the TCP connection to the Apache HTTP Server HTTP service.
* CPU utilization (total) of "httpd" processes (avg5) in % (`proc.cpu.util[httpd,,total,,avg5]`)  
  5 minute average CPU utilization in percent of the `httpd` processes.
* Memory usage (rss) of "httpd" processes (`proc.mem[httpd,,,,rss]`)  
  Memory usage in bytes of the `httpd` processes.
* Number of "httpd" processes (`proc.num[httpd]`)  
  Number of running `httpd` processes.
### Macros
* `{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_IP}` (default: 127.0.0.1)
* `{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}` (default: 443)
* `{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_IP}` (default: 127.0.0.1)
* `{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}` (default: 80)
### Triggers
* High: Apache HTTP service is down on {HOST.NAME} {$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_IP}:{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}
  ```
  {Template App Apache HTTP Server active:net.tcp.port[{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_IP},{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}].last(0)}=0
  ```
  TCP connections to the Apache HTTP Server HTTP service are not possible.
* High: Apache HTTPS service is down on {HOST.NAME} {$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_IP}:{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}
  ```
  {Template App Apache HTTP Server active:net.tcp.port[{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_IP},{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}].last(0)}=0
  ```
  TCP connections to the Apache HTTP Server HTTPS service are not possible.
* High: No running httpd processes on {HOST.NAME}
  ```
  {Template App Apache HTTP Server active:proc.num[httpd].last(0)}<1
  ```
* High: TCP port {$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Apache HTTP Server active:net.tcp.listen[{$APP_APACHE_HTTP_SERVER_HTTPS_SERVICE_PORT}].last(0)}=0
  ```
  The Apache HTTP Server HTTPS service TCP port is not in listen state.
* High: TCP port {$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Apache HTTP Server active:net.tcp.listen[{$APP_APACHE_HTTP_SERVER_HTTP_SERVICE_PORT}].last(0)}=0
  ```
  The Apache HTTP Server HTTP service TCP port is not in listen state.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
