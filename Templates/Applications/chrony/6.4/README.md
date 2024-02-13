# Zabbix Template: chrony

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: chrony](https://img.shields.io/badge/target-chrony-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Keeps track of [chrony](https://chrony-project.org/).

Needs the following configuration:
```
AllowKey=system.run[/usr/bin/chronyc -c activity]
AllowKey=system.run[/usr/bin/chronyc -c tracking]
```

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$CHRONY.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Items

### Item: chrony: chronyd process

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about chrony processes

```
proc.get[chronyd,chrony,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: chrony: Sources doing burst (return to offline)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources doing burst (return to offline).

```
rabe.chrony.activity.sources_burst_to_offline
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c activity]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[3]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources doing burst (return to online)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources doing burst (return to online).

```
rabe.chrony.activity.sources_burst_to_online
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c activity]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[2]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources offline

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources offline.

```
rabe.chrony.activity.sources_offline
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c activity]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[1]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources online

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources online.

```
rabe.chrony.activity.sources_online
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c activity]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[0]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Sources with unknown address

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Sources with unknown address.

```
rabe.chrony.activity.sources_with_unknown_address
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c activity]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[4]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: CPU seconds (system)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Total CPU seconds (system) of chronyd processes.

```
rabe.chrony.chronyd.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: CPU seconds (user)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Total CPU seconds (user) of chronyd processes.

```
rabe.chrony.chronyd.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Number of processes

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Number of chronyd processes.

```
rabe.chrony.chronyd.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Memory usage (RSS)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Memory usage of chronyd processes.

```
rabe.chrony.chronyd.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Swap usage

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Swap usage of chronyd processes.

```
rabe.chrony.chronyd.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chronyd: Number of threads

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)![component: chronyd](https://img.shields.io/badge/component-chronyd-00c9bf)

Number of chronyd threads.

```
rabe.chrony.chronyd.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[chronyd,chrony,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Reference ID

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Reference ID.

```
rabe.chrony.tracking.reference_id
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[0]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["1h"]` |

### Item: chrony: Reference IP

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Reference IP.

```
rabe.chrony.tracking.reference_ip
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[1]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["1h"]` |

### Item: chrony: Ref time (UTC)

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Ref time (UTC).

```
rabe.chrony.tracking.ref_time
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in unixtime |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[3]"]` |

### Item: chrony: Skew

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Skew.

```
rabe.chrony.tracking.skew
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in ppm |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[9]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Stratum

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

Stratum.

```
rabe.chrony.tracking.stratum
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[2]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["1h"]` |

### Item: chrony: System time slowness

![component: chrony](https://img.shields.io/badge/component-chrony-00c9bf)

System time is seconds slow of NTP time

```
rabe.chrony.tracking.system_time
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in s |
| History | 7d |
| Source item | `system.run[/usr/bin/chronyc -c tracking]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["return value.split(\",\")[4]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: chrony: Activitiy

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Results of chronyc -c activity

```
system.run[/usr/bin/chronyc -c activity]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: chrony: Tracking

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Results of chronyc -c tracking

```
system.run[/usr/bin/chronyc -c tracking]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: chronyd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running chronyd processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

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
