# Zabbix Axia ALSA Soundcard Driver for Livewire monitoring
Monitoring of the AXIA - ALSA soundcard driver for Livewire (_Axia IP Audio
Driver for Linux_).

This template collection monitors the components of the AXIA - ALSA soundcard
driver for Livewire, namely the _Axia Livewire Routing Daemon_ (`axialwrd`),
the _Axia Advertising Daemon_ (`axiaadvd`) and the _Axia GPIO Bridge for
Livewire/Control Surface control_ (`axiagpr`). There's also a check to see if
the `snd-axià` kernel module is loaded.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Axia_ALSA_Soundcard_Driver_for_Livewire_active.xml`](Template_App_Axia_ALSA_Soundcard_Driver_for_Livewire_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Axia Advertising Daemon active
Application template for the Axia Advertising Daemon (`axiaadvd`).
### Items
* LISTEN state of UDP port {$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT} (`net.udp.listen[{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT}]`)  
  Listen state of the UDP port `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT}`
* LISTEN state of UDP port {$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT} (`net.udp.listen[{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}]`)  
  Listen state of the UDP port `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}`
* Memory usage (rss) of "axiaadvd" processes (`proc.mem[axiaadvd,,,,rss]`)  
  Memory usage in bytes of the `axiaadvd` process
* Number of "axiaadvd" processes (`proc.num[axiaadvd]`)  
  Number of running `axiaadvd` processes
### Macros
* `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT}` (default: 4001)
* `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}` (default: 4000)
## Template App Axia ALSA Soundcard Driver for Livewire active
Application template for monitoring the AXIA - ALSA Soundcard Driver for Livewire related processes.
### Items
* Existence of file /dev/axia0 (`vfs.file.exists[/dev/axia0]`)  
  Check if the Axia `/dev/axia0`device node exists.
* Device status of axialivewire (`vfs.file.regmatch[/proc/devices,"[[:space:]]axialivewire$"]`)  
  Check if the `axialivewire` device is available.
* Kernel module load status of snd_axia (`vfs.file.regmatch[/proc/modules,"^snd_axia[[:space:]]"]`)  
  Check if the Axia Alsa kernel module `snd_axia` is available.
## Template App Axia GPIO Bridge for Livewire Control Surface control active
Application template for the Axia GPIO Bridge for Livewire/Control Surface control process (`axiagpr`).
### Items
* Memory usage (rss) of "axiagpr" processes (`proc.mem[axiagpr,,,,rss]`)  
  Memory usage in bytes of the `axiagpr` process
* Number of "axiagpr" processes (`proc.num[axiagpr]`)  
  Number of running `axiagpr` processes
## Template App Axia Livewire Routing Daemon active
Application template for the Axia Livewire Routing Daemon (`axialwrd`).
### Items
* LISTEN state of TCP port {$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT} (`net.tcp.listen[{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}]`)  
  Listen state of the TCP port `{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}`
* Memory usage (rss) of "axialwrd" processes (`proc.mem[axialwrd,,,,rss]`)  
  Memory usage in bytes of the `axialwrd` process
* Number of "axialwrd" processes (`proc.num[axialwrd]`)  
  Number of running `axialwrd` processes
### Macros
* `{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}` (default: 93)
### Triggers
* High: Axia device node (/dev/axia0) missing on {HOST.NAME}
  ```
  {Template App Axia ALSA Soundcard Driver for Livewire active:vfs.file.exists[/dev/axia0].last()}<1
  ```
  There is no Axia device node (`/dev/axia0`) on this host.
* High: No running Axia Advertising Daemon (axiaadvd) processes on {HOST.NAME}
  ```
  {Template App Axia Advertising Daemon active:proc.num[axiaadvd].last(0)}<1
  ```
  There is no Axia Advertising Daemon (`axiaadvd`) running on this host.
* High: No running Axia GPIO Bridge for Livewire/Control Surface control (axiagpr) processes on {HOST.NAME}
  ```
  {Template App Axia GPIO Bridge for Livewire Control Surface control active:proc.num[axiagpr].last(0)}<1
  ```
  There is no Axia GPIO Bridge for Livewire/Control Surface control (`axiagpr`) process running on this host.
* High: No running Axia Livewire Routing Daemon (axialwrd) processes on {HOST.NAME}
  ```
  {Template App Axia Livewire Routing Daemon active:proc.num[axialwrd].last(0)}<1
  ```
  There is no Axia Livewire Routing Daemon (`axialwrd`) running on this host.
* High: TCP port {{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}} not in listen state on {HOST.NAME}
  ```
  {Template App Axia Livewire Routing Daemon active:net.tcp.listen[{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}].last(0)}=0
  ```
  The Axia Livewire Routing Daemon's TCP port `{$APP_AXIA_LIVEWIRE_ROUTING_DAEMON_ROUTING_PORT}` is not in listen state.
* High: UDP port {$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Axia Advertising Daemon active:net.udp.listen[{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}].last(0)}=0
  ```
  The Axia Livewire Advertising Daemon's UDP port `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_PORT}` is not in listen state.
* High: UDP port {$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT} not in listen state on {HOST.NAME}
  ```
  {Template App Axia Advertising Daemon active:net.udp.listen[{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}].last(0)}=0
  ```
  The Axia Livewire Advertising Daemon's UDP port `{$APP_AXIA_ADVERTISING_DAEMON_LIVEWIRE_ADVERTISEMENT_REQ_PORT}` is not in listen state.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
