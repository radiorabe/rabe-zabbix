# Zabbix Template: systemd-journald

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: systemd-journald](https://img.shields.io/badge/target-systemd-journald-00c9bf)

Monitoring of [systemd-journald](https://www.freedesktop.org/software/systemd/man/latest/systemd-journald.service.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: systemd-journald: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about systemd-journald processes

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

```
proc.get[systemd-journald,root,,summary]
```

### Item: systemd-journald: CPU seconds (system)

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Total CPU seconds (system) of systemd-journald processes.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |

```
rabe.systemd-journald.cputime_system
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-journald: CPU seconds (user)

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Total CPU seconds (user) of systemd-journald processes.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |

```
rabe.systemd-journald.cputime_user
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-journald: Number of processes

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Number of systemd-journald processes.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |

```
rabe.systemd-journald.processes
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-journald: Memory usage (RSS)

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Memory usage of systemd-journald processes.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |

```
rabe.systemd-journald.rss
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-journald: Swap usage

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Swap usage of systemd-journald processes.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |

```
rabe.systemd-journald.swap
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-journald: Number of threads

![component: systemd-journald](https://img.shields.io/badge/component-systemd-journald-00c9bf)

Number of systemd-journald threads.

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |

```
rabe.systemd-journald.threads
```
Source item: `proc.get[systemd-journald,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: systemd-journald: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running systemd-journald processes.

Priority: HIGH

```
last(/systemd-journald/rabe.systemd-journald.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* systemd-journald: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
