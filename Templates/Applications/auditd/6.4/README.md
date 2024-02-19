# Zabbix Template: auditd

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: auditd](https://img.shields.io/badge/target-auditd-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [auditd](https://people.redhat.com/sgrubb/audit/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: auditd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about auditd processes

```console
proc.get[auditd,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: auditd: Unit active state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the unit is currently active or not. The following states are currently defined: "active", "reloading", "inactive", "failed", "activating", and "deactivating".

```console
rabe.auditd.active_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["auditd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.ActiveState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: auditd: CPU seconds (system)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Total CPU seconds (system) of auditd processes.

```console
rabe.auditd.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: CPU seconds (user)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Total CPU seconds (user) of auditd processes.

```console
rabe.auditd.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Service load state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the configuration file of this unit has been loaded. The following states are currently defined: "loaded", "error", and "masked".

```console
rabe.auditd.load_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["auditd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.LoadState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: auditd: Number of processes

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Number of auditd processes.

```console
rabe.auditd.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Memory usage (RSS)

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Memory usage of auditd processes.

```console
rabe.auditd.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Swap usage

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Swap usage of auditd processes.

```console
rabe.auditd.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Number of threads

![component: auditd](https://img.shields.io/badge/component-auditd-00c9bf)

Number of auditd threads.

```console
rabe.auditd.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[auditd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: auditd: Unit file state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Encodes the install state of the unit file of FragmentPath. It currently knows the following states: "enabled", "enabled-runtime", "linked", "linked-runtime", "masked", "masked-runtime", "static", "disabled", and "invalid".

```console
rabe.auditd.unitfile_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["auditd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.UnitFileState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: auditd: Uptime

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Number of seconds since unit entered the active state.

```console
rabe.auditd.uptime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in uptime |
| History | 7d |
| Source item | `systemd.unit.get["auditd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["data = JSON.parse(value);\nif (data.ActiveEnterTimestamp > data.ActiveExitTimestamp) {\n      return Math.floor(Date.now() / 1000) - Number(data.ActiveEnterTimestamp) / 1000000;\n}\nreturn null;\n"]` |

### Item: auditd: unit info

![component: raw](https://img.shields.io/badge/component-raw-00c9bf) ![component: unit](https://img.shields.io/badge/component-unit-00c9bf)

Get unit info from systemd

```console
systemd.unit.get["auditd.service"]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: auditd: Service is not running

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |
| Manual close | YES |

```console
last(/auditd/rabe.auditd.active_state)<>1
```

### Trigger: auditd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running auditd processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/auditd/rabe.auditd.processes)<{$AUDITD.THRESHOLD.MIN_PROC}
```

### Trigger: auditd: has been restarted

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/auditd/rabe.auditd.uptime)<=10m
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$AUDITD.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:

```console
1
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
