# Zabbix Template: systemd-udevd

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: systemd-udevd](https://img.shields.io/badge/target-systemd-udevd-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Monitoring of [systemd-udevd](https://www.freedesktop.org/software/systemd/man/latest/systemd-udevd.service.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: systemd-udevd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about systemd-udevd processes

```console
proc.get[systemd-udevd,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: systemd-udevd: Unit active state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the unit is currently active or not. The following states are currently defined: "active", "reloading", "inactive", "failed", "activating", and "deactivating".

```console
rabe.systemd-udevd.active_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["systemd-udevd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.ActiveState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: systemd-udevd: CPU seconds (system)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Total CPU seconds (system) of systemd-udevd processes.

```console
rabe.systemd-udevd.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: CPU seconds (user)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Total CPU seconds (user) of systemd-udevd processes.

```console
rabe.systemd-udevd.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Service load state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the configuration file of this unit has been loaded. The following states are currently defined: "loaded", "error", and "masked".

```console
rabe.systemd-udevd.load_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["systemd-udevd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.LoadState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: systemd-udevd: Number of processes

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Number of systemd-udevd processes.

```console
rabe.systemd-udevd.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Memory usage (RSS)

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Memory usage of systemd-udevd processes.

```console
rabe.systemd-udevd.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Swap usage

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Swap usage of systemd-udevd processes.

```console
rabe.systemd-udevd.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Number of threads

![component: systemd-udevd](https://img.shields.io/badge/component-systemd-udevd-00c9bf)

Number of systemd-udevd threads.

```console
rabe.systemd-udevd.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-udevd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-udevd: Unit file state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Encodes the install state of the unit file of FragmentPath. It currently knows the following states: "enabled", "enabled-runtime", "linked", "linked-runtime", "masked", "masked-runtime", "static", "disabled", and "invalid".

```console
rabe.systemd-udevd.unitfile_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["systemd-udevd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.UnitFileState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: systemd-udevd: Uptime

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Number of seconds since unit entered the active state.

```console
rabe.systemd-udevd.uptime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in uptime |
| History | 7d |
| Source item | `systemd.unit.get["systemd-udevd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["data = JSON.parse(value);\nif (data.ActiveEnterTimestamp > data.ActiveExitTimestamp) {\n      return Math.floor(Date.now() / 1000) - Number(data.ActiveEnterTimestamp) / 1000000;\n}\nreturn null;\n"]` |

### Item: systemd-udevd: unit info

![component: raw](https://img.shields.io/badge/component-raw-00c9bf) ![component: unit](https://img.shields.io/badge/component-unit-00c9bf)

Get unit info from systemd

```console
systemd.unit.get["systemd-udevd.service"]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: systemd-udevd: Service is not running

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |
| Manual close | YES |

```console
last(/systemd-udevd/rabe.systemd-udevd.active_state)<>1
```

### Trigger: systemd-udevd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running systemd-udevd processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/systemd-udevd/rabe.systemd-udevd.processes)<{$SYSTEMDUDEVD.THRESHOLD.MIN_PROC}
```

### Trigger: systemd-udevd: has been restarted

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/systemd-udevd/rabe.systemd-udevd.uptime)<=10m
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SYSTEMDUDEVD.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:

```console
1
```

## Dashboards

The following Zabbix dashboards are included in this template.

* systemd-udevd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
