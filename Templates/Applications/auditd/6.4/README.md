# Zabbix Template: auditd

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: auditd](https://img.shields.io/badge/target-auditd-00c9bf)

Keeps track of [auditd](https://people.redhat.com/sgrubb/audit/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: auditd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about auditd processes

Type: ZABBIX_ACTIVE

```
proc.get[auditd,root,,summary]
```

### Item: auditd: CPU seconds (system)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Total CPU seconds (system) of auditd processes.

Type: DEPENDENT

```
rabe.auditd.cputime_system
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: CPU seconds (user)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Total CPU seconds (user) of auditd processes.

Type: DEPENDENT

```
rabe.auditd.cputime_user
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Number of processes

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Number of auditd processes.

Type: DEPENDENT

```
rabe.auditd.processes
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Memory usage (RSS)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Memory usage of auditd processes.

Type: DEPENDENT

```
rabe.auditd.rss
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Swap usage

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Swap usage of auditd processes.

Type: DEPENDENT

```
rabe.auditd.swap
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Number of threads

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Number of auditd threads.

Type: DEPENDENT

```
rabe.auditd.threads
```
Source item: `proc.get[auditd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: auditd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running auditd processes.

Priority: HIGH

```
last(/auditd/rabe.auditd.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* auditd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
