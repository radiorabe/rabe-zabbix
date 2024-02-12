# Zabbix Template: QEMU Guest Agent

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: qemu-ga](https://img.shields.io/badge/target-qemu-ga-00c9bf)

Monitoring of the [QEMU Guest Agent](https://www.qemu.org/docs/master/interop/qemu-ga.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: qemu-ga: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about qemu-ga processes

Type: ZABBIX_ACTIVE

```
proc.get[qemu-ga,root,,summary]
```

### Item: qemu-ga: CPU seconds (system)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (system) of qemu-ga processes.

Type: DEPENDENT

```
rabe.qemu-ga.cputime_system
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: CPU seconds (user)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (user) of qemu-ga processes.

Type: DEPENDENT

```
rabe.qemu-ga.cputime_user
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Number of processes

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga processes.

Type: DEPENDENT

```
rabe.qemu-ga.processes
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Memory usage (RSS)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Memory usage of qemu-ga processes.

Type: DEPENDENT

```
rabe.qemu-ga.rss
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Swap usage

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Swap usage of qemu-ga processes.

Type: DEPENDENT

```
rabe.qemu-ga.swap
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Number of threads

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga threads.

Type: DEPENDENT

```
rabe.qemu-ga.threads
```
Source item: `proc.get[qemu-ga,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: qemu-ga: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running qemu-ga processes.

Priority: HIGH

```
last(/qemu-ga/rabe.qemu-ga.processes)<1
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
