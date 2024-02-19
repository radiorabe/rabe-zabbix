# Zabbix ntpd monitoring
Monitoring for ntpd.

There is both a template for authoritative ntpd servers as well as for simple
clock slaves. They share most items and differ in what exactly gets triggered.

The client template takes special care to check that all configured servers 
are valid peers while the server configuration will focus more on making sure 
that a local cluster of ntpd services stays in sync with an NTP pool.

Basics that do not differ from the client to the server are in a common
template which the individual server and client templates reference.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_ntpd_active.xml`](Template_App_ntpd_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App ntpd Client active
### Discovery
#### NTP servers (`rabe.ntpd.server.discovery`)
##### Item Prototypes
* NTP server {#SERVERNAME} candidate order (`rabe.ntpd.server.candidate_order[{#SERVERNAME}]`)  
* NTP server {#SERVERNAME} configuration (`vfs.file.regexp[/etc/ntp.conf,"^server.*{#SERVERNAME} (.*)",,,,\1]`)  
##### Trigger Prototypes
* Warning: NTP server {#SERVERNAME} is not a valid candidate on {HOST.NAME}
  ```
  {Template App ntpd Client active:rabe.ntpd.server.candidate_order[{#SERVERNAME}].last()}=0
  ```
  If a configured server has a candidate order of 0 it is not considered as a valid time source and most likely has some issues.
## Template App ntpd Common active
### Items
* Memory usage (rss) of "ntpd" processes (`proc.mem[ntpd,ntp,,,rss]`)  
* Number of "ntpd" processes (`proc.num[ntpd,ntp]`)  
* ntpd authdelay (`rabe.ntpdc.sysinfo[authdelay,single]`)  
* ntpd broadcastdelay (`rabe.ntpdc.sysinfo[broadcastdelay,single]`)  
* ntpd jitter (`rabe.ntpdc.sysinfo[jitter,single]`)  
* ntpd precision (`rabe.ntpdc.sysinfo[precision]`)  
* ntpd root dispersion (`rabe.ntpdc.sysinfo[root dispersion,single]`)  
* ntpd root distance (`rabe.ntpdc.sysinfo[root distance,single]`)  
* ntpd stability (`rabe.ntpdc.sysinfo[stability,single]`)  
* ntpd stratum (`rabe.ntpdc.sysinfo[stratum]`)  
* ntpd system flags (`rabe.ntpdc.sysinfo[system flags]`)  
* ntpd system peer mode (`rabe.ntpdc.sysinfo[system peer mode]`)  
* ntpd system peer (`rabe.ntpdc.sysinfo[system peer]`)  
## Template App ntpd Server active
### Triggers
* High: No running ntpd processes on {HOST.NAME}
  ```
  {Template App ntpd Common active:proc.num[ntpd,ntp].max(#5)}<1
  ```
  We expect ntpd to run at all times
* Warning: ntpd system peer mode is not client on host {HOST.NAME}
  ```
  {Template App ntpd Common active:rabe.ntpdc.sysinfo[system peer mode].regexp(client)}<>0
  ```
  Our clients should always be in client peer mode. If they are not, chances are that they are not clients any more.
## SELinux Policy

The [rabezbxntpd](selinux/rabezbxntpd.te) policy allows the agent to access ntpd configuration files.
## UserParameters

| Key | Description |
| --- | ----------- |
| `rabe.ntpd.server.discovery` | List of configured servers in ntp.conf for low level discovery |
| `rabe.ntpd.server.candidate_order[<server>]` | Candidate order of a known peer (0 if peer is not a candidate) |
| `rabe.ntpdc.sysinfo[<value name>[,"single"]]` | Get value by name from `ntpdc -c sysinfo` using `rabe-ntpdc-sysinfo.sh` script (use "single" as "$2" if you only need the first value up to a whitespace) |
## Scripts

* [rabe-ntpdc-sysinfo.sh](./scripts/rabe-ntpdc-sysinfo.sh) for rabe.ntpdc.sysinfo UserParameter

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
