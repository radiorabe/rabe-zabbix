# Zabbix timedatectl monitoring
High level monitoring for time and date keeping based on the backend agnostic [timedatectl](https://www.freedesktop.org/software/systemd/man/timedatectl.html) command.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_timedatectl_active.xml`](Template_App_timedatectl_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App timedatectl active
### Items
* NTP enabled (`rabe.timedatectl.ntp.enabled`)  
* NTP synchronized (`rabe.timedatectl.ntp.synchronized`)  
### Macros
* `{$TIMEDATECTL_MAX_NO_SYNC_TIME}` (default: 60m)
### Triggers
* Warning: NTP not enabled on {HOST.NAME}
  ```
  {Template App timedatectl active:rabe.timedatectl.ntp.enabled.last()}=0
  ```
* Information: NTP not synchronized on {HOST.NAME}
  ```
  {Template App timedatectl active:rabe.timedatectl.ntp.synchronized.last()}=0
  ```
* Warning: NTP not synchronized for more than {$TIMEDATECTL_MAX_NO_SYNC_TIME} on {HOST.NAME}
  ```
  {Template App timedatectl active:rabe.timedatectl.ntp.synchronized.last(,{$TIMEDATECTL_MAX_NO_SYNC_TIME})}<1
  ```
## SELinux Policy

The [rabetimedatectl](selinux/rabetimedatectl.te) policy module allows the agent to connect to dbus and lets
it request info from the timedated service. It also allows answers from the timedated service to the agent.
## UserParameters

| Key | Description |
| --- | ----------- |
| `rabe.timedatectl.ntp.enabled` | "NTP enabled" yes/no value from `timedatectl status` output |
| `rabe.timedatectl.ntp.synchronized` | "NTP synchonized" yes/no value from `timedatectl status` output |

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
