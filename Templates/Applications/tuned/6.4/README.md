# Zabbix Template: tuned

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: tuned](https://img.shields.io/badge/target-tuned-00c9bf)

Monitoring of [tuned](https://tuned-project.org/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: tuned: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about tuned processes

Type: ZABBIX_ACTIVE

```
proc.get[tuned,root,,summary]
```

### Item: tuned: CPU seconds (system)

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Total CPU seconds (system) of tuned processes.

Type: DEPENDENT

```
rabe.tuned.cputime_system
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: tuned: CPU seconds (user)

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Total CPU seconds (user) of tuned processes.

Type: DEPENDENT

```
rabe.tuned.cputime_user
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: tuned: Number of processes

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Number of tuned processes.

Type: DEPENDENT

```
rabe.tuned.processes
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: tuned: Memory usage (RSS)

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Memory usage of tuned processes.

Type: DEPENDENT

```
rabe.tuned.rss
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: tuned: Swap usage

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Swap usage of tuned processes.

Type: DEPENDENT

```
rabe.tuned.swap
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: tuned: Number of threads

![component: tuned](https://img.shields.io/badge/component-tuned-00c9bf)

Number of tuned threads.

Type: DEPENDENT

```
rabe.tuned.threads
```
Source item: `proc.get[tuned,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: tuned: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running tuned processes.

Priority: HIGH

```
last(/tuned/rabe.tuned.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* tuned: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
