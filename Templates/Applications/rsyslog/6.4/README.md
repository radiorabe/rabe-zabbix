# Zabbix Template: rsyslog

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: rsyslog](https://img.shields.io/badge/target-rsyslog-00c9bf)

Monitoring of [rsyslog](https://www.rsyslog.com/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: rsyslog: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about rsyslog processes

Type: ZABBIX_ACTIVE

```
proc.get[rsyslogd,root,,summary]
```

### Item: rsyslog: CPU seconds (system)

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Total CPU seconds (system) of rsyslog processes.

Type: DEPENDENT

```
rabe.rsyslog.cputime_system
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rsyslog: CPU seconds (user)

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Total CPU seconds (user) of rsyslog processes.

Type: DEPENDENT

```
rabe.rsyslog.cputime_user
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rsyslog: Number of processes

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Number of rsyslog processes.

Type: DEPENDENT

```
rabe.rsyslog.processes
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rsyslog: Memory usage (RSS)

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Memory usage of rsyslog processes.

Type: DEPENDENT

```
rabe.rsyslog.rss
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rsyslog: Swap usage

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Swap usage of rsyslog processes.

Type: DEPENDENT

```
rabe.rsyslog.swap
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rsyslog: Number of threads

![component: rsyslog](https://img.shields.io/badge/component-rsyslog-00c9bf)

Number of rsyslog threads.

Type: DEPENDENT

```
rabe.rsyslog.threads
```
Source item: `proc.get[rsyslogd,root,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: rsyslog: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running rsyslog processes.

Priority: HIGH

```
last(/rsyslog/rabe.rsyslog.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* rsyslog: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
