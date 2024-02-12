# Zabbix Template: Cronie

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: Cronie](https://img.shields.io/badge/target-Cronie-00c9bf)

Monitoring of [Cronie](https://github.com/cronie-crond/cronie).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: Cronie: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about Cronie processes

Type: ZABBIX_ACTIVE

```
proc.get[crond,root,,summary]
```

### Item: Cronie: CPU seconds (system)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Total CPU seconds (system) of Cronie processes.

Type: DEPENDENT

```
rabe.Cronie.cputime_system
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: CPU seconds (user)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Total CPU seconds (user) of Cronie processes.

Type: DEPENDENT

```
rabe.Cronie.cputime_user
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Number of processes

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Number of Cronie processes.

Type: DEPENDENT

```
rabe.Cronie.processes
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Memory usage (RSS)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Memory usage of Cronie processes.

Type: DEPENDENT

```
rabe.Cronie.rss
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Swap usage

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Swap usage of Cronie processes.

Type: DEPENDENT

```
rabe.Cronie.swap
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Number of threads

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Number of Cronie threads.

Type: DEPENDENT

```
rabe.Cronie.threads
```
Source item: `proc.get[crond,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: Cronie: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running Cronie processes.

Priority: HIGH

```
last(/Cronie/rabe.Cronie.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* Cronie: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
