# ntpd

Monitoring for ntpd

* [Template App ntpd Common active](Template_App_ntpd_Common_active.xml)
* [Template App ntpd Client active](Template_App_ntpd_Client_active.xml)
* [Template App ntpd Server active](Template_App_ntpd_Server_active.xml)
* [ntpd.conf](./userparameters/ntpd.conf)
* [rabe-ntpdc-sysinfo.sh script](./scripts/rabe-ntpd-sysinfo.sh)
* [SELinux policy module rabezbxntpd](selinux/rabezbxntpd.te)

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
 
## Templates

There is both a template for authoritative ntpd servers as well as for simple
clock slaves. They share most items and differ in what exactly gets triggered.

The client template takes special care to check that all configured servers 
are valid peers while the server configuration will focus more on making sure 
that a local cluster of ntpd services stays in sync with an NTP pool.

Basics that do not differ from the client to the server are in a common
template which the individual server and client templates reference.

### Items

#### Common

* Memory usage (rss) of "ntpd" processes (proc.mem[ntpd,ntp,,,rss])
* Number of "ntpd" processes (proc.num[ntpd,ntp])
* ntpd system peer (rabe.ntpdc.sysinfo[system peer])
* ntpd system peer mode (rabe.ntpdc.sysinfo[system peer mode])
* ntpd stratum (rabe.ntpdc.sysinfo[stratum])
* ntpd precision (rabe.ntpdc.sysinfo[precision])
* ntpd root distance (rabe.ntpdc.sysinfo[root distance])
* ntpd root dispersion (rabe.ntpdc.sysinfo[root dispersion])
* ntpd system flags (rabe.ntpdc.sysinfo[system flags])
* ntpd jitter (rabe.ntpdc.sysinfo[jitter])
* ntpd stability (rabe.ntpdc.sysinfo[stability])
* ntpd broadcastdelay (rabe.ntpdc.sysinfo[broadcastdelay])
* ntpd authdelay (rabe.ntpdc.sysinfo[authdelay])

#### Client

The following Items are created for each discovered Server

* NTP server {#SERVERNAME} candidate order (rabe.ntpd.server.candidate_order[{#SERVERNAME}])
* NTP server {#SERVERNAME} configuration (vfs.file.regexp[/etc/ntp.conf,"^server.*{#SERVERNAME} (.*)",,,,\1])

#### Server

### Triggers

#### Common

* High: No running ntpd processes on {HOST.NAME}

* Warning: ntpd system peer mode is not client on {HOST.NAME}

  Gets triggered when a system does not identify itself as in system peer mode "client".

#### Client

The following Triggers are created for each discovered Server

* Warning: NTP server {#SERVERNAME} is not a valid candidate  on {HOST.NAME}

  Gets triggered when a configured server is considered as invalid as indicated by it having a candidate order of 0.
  
#### Server

### Discovery Rules

* NTP servers (rabe.ntpd.server.discovery)

### Macros

## SELinux Policy

The [rabezbxntpd](selinux/rabezbxntpd.te) policy allows the agent to access ntpd configuration files.

## UserParameters

| Key | Description |
| --- | ----------- |
| `rabe.ntpd.server.discovery` | List of configured servers in ntp.conf for low level discovery |
| `rabe.ntpd.server.candidate_order[<server>]` | Candidate order of a known peer (0 if peer is not a candidate) |
| `rabe.ntpdc.sysinfo[<value name>[,"single"]]` | Get value by name from `ntpdc -c sysinfo` using `rabe-ntpdc-sysinfo.sh` script (use "single" as "$2" if you only need the first value up to a whitespace) |

## Scripts

* [rabe-ntpdc-sysinfo.sh](./scripts/rabe-ntpd-sysinfo.sh) for rabe.ntpdc.sysinfo UserParameter

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
