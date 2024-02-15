# Zabbix Template: QEMU Guest Agent

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: qemu-ga](https://img.shields.io/badge/target-qemu-ga-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of the [QEMU Guest Agent](https://www.qemu.org/docs/master/interop/qemu-ga.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: qemu-ga: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about qemu-ga processes

```
proc.get[qemu-ga,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: qemu-ga: CPU seconds (system)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (system) of qemu-ga processes.

```
rabe.qemu-ga.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: CPU seconds (user)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (user) of qemu-ga processes.

```
rabe.qemu-ga.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Number of processes

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga processes.

```
rabe.qemu-ga.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Memory usage (RSS)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Memory usage of qemu-ga processes.

```
rabe.qemu-ga.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Swap usage

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Swap usage of qemu-ga processes.

```
rabe.qemu-ga.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Number of threads

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga threads.

```
rabe.qemu-ga.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

### Trigger: qemu-ga: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running qemu-ga processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/qemu-ga/rabe.qemu-ga.processes)<{$QEMUGA.THRESHOLD.MIN_PROC}
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$QEMUGA.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Dashboards

The following Zabbix dashboards are included in this template.

* qemu-ga: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
