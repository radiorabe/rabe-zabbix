# Zabbix Template: sssd

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: sssd](https://img.shields.io/badge/target-sssd-00c9bf)

Monitoring of [sssd](https://sssd.io).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: sssd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about sssd processes

Type: ZABBIX_ACTIVE

```
proc.get[sssd,root,,summary]
```

### Item: sssd: CPU seconds (system)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Total CPU seconds (system) of sssd processes.

Type: DEPENDENT

```
rabe.sssd.cputime_system
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: CPU seconds (user)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Total CPU seconds (user) of sssd processes.

Type: DEPENDENT

```
rabe.sssd.cputime_user
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Number of processes

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Number of sssd processes.

Type: DEPENDENT

```
rabe.sssd.processes
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Memory usage (RSS)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Memory usage of sssd processes.

Type: DEPENDENT

```
rabe.sssd.rss
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Swap usage

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Swap usage of sssd processes.

Type: DEPENDENT

```
rabe.sssd.swap
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Number of threads

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Number of sssd threads.

Type: DEPENDENT

```
rabe.sssd.threads
```
Source item: `proc.get[sssd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: sssd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running sssd processes.

Priority: HIGH

```
last(/sssd/rabe.sssd.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* sssd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
