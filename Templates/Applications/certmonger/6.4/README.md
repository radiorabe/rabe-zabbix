# Zabbix Template: certmonger

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: certmonger](https://img.shields.io/badge/target-certmonger-00c9bf)

Monitoring of [certmonger](https://www.freeipa.org/page/Certmonger).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: certmonger: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about certmonger processes

Type: ZABBIX_ACTIVE

```
proc.get[certmonger,root,,summary]
```

### Item: certmonger: CPU seconds (system)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (system) of certmonger processes.

Type: DEPENDENT

```
rabe.certmonger.cputime_system
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: CPU seconds (user)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (user) of certmonger processes.

Type: DEPENDENT

```
rabe.certmonger.cputime_user
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Number of processes

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger processes.

Type: DEPENDENT

```
rabe.certmonger.processes
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Memory usage (RSS)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Memory usage of certmonger processes.

Type: DEPENDENT

```
rabe.certmonger.rss
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Swap usage

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Swap usage of certmonger processes.

Type: DEPENDENT

```
rabe.certmonger.swap
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Number of threads

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger threads.

Type: DEPENDENT

```
rabe.certmonger.threads
```
Source item: `proc.get[certmonger,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: certmonger: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running certmonger processes.

Priority: HIGH

```
last(/certmonger/rabe.certmonger.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* certmonger: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
