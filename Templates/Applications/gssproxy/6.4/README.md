# Zabbix Template: gssproxy

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: gssproxy](https://img.shields.io/badge/target-gssproxy-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [gssproxy](https://pagure.io/gssproxy).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: gssproxy: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about gssproxy processes

```
proc.get[gssproxy,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: gssproxy: CPU seconds (system)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Total CPU seconds (system) of gssproxy processes.

```
rabe.gssproxy.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: CPU seconds (user)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Total CPU seconds (user) of gssproxy processes.

```
rabe.gssproxy.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Number of processes

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Number of gssproxy processes.

```
rabe.gssproxy.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Memory usage (RSS)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Memory usage of gssproxy processes.

```
rabe.gssproxy.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Swap usage

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Swap usage of gssproxy processes.

```
rabe.gssproxy.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Number of threads

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Number of gssproxy threads.

```
rabe.gssproxy.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[gssproxy,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

### Trigger: gssproxy: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running gssproxy processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/gssproxy/rabe.gssproxy.processes)<{$GSSPROXY.THRESHOLD.MIN_PROC}
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$GSSPROXY.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Dashboards

The following Zabbix dashboards are included in this template.

* gssproxy: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
