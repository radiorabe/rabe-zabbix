# Zabbix Template: Cronie

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: Cronie](https://img.shields.io/badge/target-Cronie-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [Cronie](https://github.com/cronie-crond/cronie).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$CRONIE.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Items

### Item: Cronie: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about Cronie processes

```
proc.get[crond,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: Cronie: CPU seconds (system)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Total CPU seconds (system) of Cronie processes.

```
rabe.Cronie.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: CPU seconds (user)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Total CPU seconds (user) of Cronie processes.

```
rabe.Cronie.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Number of processes

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Number of Cronie processes.

```
rabe.Cronie.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Memory usage (RSS)

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Memory usage of Cronie processes.

```
rabe.Cronie.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Swap usage

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Swap usage of Cronie processes.

```
rabe.Cronie.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Cronie: Number of threads

![component: Cronie](https://img.shields.io/badge/component-Cronie-00c9bf)

Number of Cronie threads.

```
rabe.Cronie.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[crond,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

### Trigger: Cronie: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running Cronie processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/Cronie/rabe.Cronie.processes)<{$CRONIE.THRESHOLD.MIN_PROC}
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
