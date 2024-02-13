# Zabbix Template: systemd-udevd

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: systemd-udevd](https://img.shields.io/badge/target-systemd-udevd-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [systemd-udevd](https://www.freedesktop.org/software/systemd/man/latest/systemd-udevd.service.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SYSTEMDUDEVD.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Items

### Item: systemd-udevd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about systemd-udevd processes

```
proc.get[systemd-udevd,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: systemd-udevd: CPU seconds (system)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Total CPU seconds (system) of systemd-udevd processes.

```
rabe.systemd-udevd.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: CPU seconds (user)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Total CPU seconds (user) of systemd-udevd processes.

```
rabe.systemd-udevd.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Number of processes

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Number of systemd-udevd processes.

```
rabe.systemd-udevd.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Memory usage (RSS)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Memory usage of systemd-udevd processes.

```
rabe.systemd-udevd.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Swap usage

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Swap usage of systemd-udevd processes.

```
rabe.systemd-udevd.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Number of threads

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Number of systemd-udevd threads.

```
rabe.systemd-udevd.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

### Trigger: systemd-udevd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running systemd-udevd processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/systemd-udevd/rabe.systemd-udevd.processes)<{$SYSTEMDUDEVD.THRESHOLD.MIN_PROC}
```

## Dashboards

The following Zabbix dashboards are included in this template.
* systemd-udevd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
