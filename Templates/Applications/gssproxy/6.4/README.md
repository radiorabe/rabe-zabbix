# Zabbix Template: gssproxy

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: gssproxy](https://img.shields.io/badge/target-gssproxy-00c9bf)

Monitoring of [gssproxy](https://pagure.io/gssproxy).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: gssproxy: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about gssproxy processes

Type: ZABBIX_ACTIVE

```
proc.get[gssproxy,root,,summary]
```

### Item: gssproxy: CPU seconds (system)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Total CPU seconds (system) of gssproxy processes.

Type: DEPENDENT

```
rabe.gssproxy.cputime_system
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: CPU seconds (user)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Total CPU seconds (user) of gssproxy processes.

Type: DEPENDENT

```
rabe.gssproxy.cputime_user
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Number of processes

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Number of gssproxy processes.

Type: DEPENDENT

```
rabe.gssproxy.processes
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Memory usage (RSS)

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Memory usage of gssproxy processes.

Type: DEPENDENT

```
rabe.gssproxy.rss
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Swap usage

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Swap usage of gssproxy processes.

Type: DEPENDENT

```
rabe.gssproxy.swap
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: gssproxy: Number of threads

![component: gssproxy](https://img.shields.io/badge/component-gssproxy-00c9bf)

Number of gssproxy threads.

Type: DEPENDENT

```
rabe.gssproxy.threads
```
Source item: `proc.get[gssproxy,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: gssproxy: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running gssproxy processes.

Priority: HIGH

```
last(/gssproxy/rabe.gssproxy.processes)<1
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
