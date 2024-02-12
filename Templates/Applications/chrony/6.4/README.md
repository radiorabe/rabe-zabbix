# Zabbix Template: chrony

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: chrony](https://img.shields.io/badge/target-chrony-00c9bf)

Keeps track of chrony.

Needs the following configuration:
```
AllowKey=system.run[/usr/bin/chronyc -c activity]
```

Managed by <https://github.com/radiorabe/rabe-zabbix>.


## Items

### Item: chrony: chronyd process

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about chrony processes

Type: ZABBIX_ACTIVE

```
proc.get[chronyd,chrony,,summary]
```

### Item: chrony: Sources doing burst (return to offline)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources doing burst (return to offline).

Type: DEPENDENT

```
rabe.chrony.activity.sources_burst_to_offline
```
Source item: `system.run[/usr/bin/chronyc -c activity]`

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[3]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources doing burst (return to online)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources doing burst (return to online).

Type: DEPENDENT

```
rabe.chrony.activity.sources_burst_to_online
```
Source item: `system.run[/usr/bin/chronyc -c activity]`

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[2]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources offline

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources offline.

Type: DEPENDENT

```
rabe.chrony.activity.sources_offline
```
Source item: `system.run[/usr/bin/chronyc -c activity]`

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[1]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources online

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources online.

Type: DEPENDENT

```
rabe.chrony.activity.sources_online
```
Source item: `system.run[/usr/bin/chronyc -c activity]`

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[0]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources with unknown address

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources with unknown address.

Type: DEPENDENT

```
rabe.chrony.activity.sources_with_unknown_address
```
Source item: `system.run[/usr/bin/chronyc -c activity]`

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[4]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: CPU seconds (system)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Total CPU seconds (system) of chronyd processes.

Type: DEPENDENT

```
rabe.chrony.chronyd.cputime_system
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: CPU seconds (user)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Total CPU seconds (user) of chronyd processes.

Type: DEPENDENT

```
rabe.chrony.chronyd.cputime_user
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Number of processes

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Number of chronyd processes.

Type: DEPENDENT

```
rabe.chrony.chronyd.processes
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Memory usage (RSS)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Memory usage of chronyd processes.

Type: DEPENDENT

```
rabe.chrony.chronyd.rss
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Swap usage

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Swap usage of chronyd processes.

Type: DEPENDENT

```
rabe.chrony.chronyd.swap
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Number of threads

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Number of chronyd threads.

Type: DEPENDENT

```
rabe.chrony.chronyd.threads
```
Source item: `proc.get[chronyd,chrony,,summary]`

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Activitiy

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Results of chronyc -c activity

Type: ZABBIX_ACTIVE

```
system.run[/usr/bin/chronyc -c activity]
```

## Triggers

## Trigger: chronyd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running chronyd processes.

Priority: HIGH

```
last(/chrony/rabe.chrony.chronyd.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* chrony: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)