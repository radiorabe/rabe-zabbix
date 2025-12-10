# Zabbix Template: QEMU Guest Agent (active)

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: qemu-ga](https://img.shields.io/badge/target-qemu-ga-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Monitoring of the [QEMU Guest Agent](https://www.qemu.org/docs/master/interop/qemu-ga.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: qemu-ga: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about qemu-ga processes

```console
proc.get[qemu-ga,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: qemu-ga: Unit active state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the unit is currently active or not. The following states are currently defined: "active", "reloading", "inactive", "failed", "activating", and "deactivating".

```console
rabe.qemu-ga.active_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["qemu-guest-agent.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.ActiveState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: qemu-ga: CPU seconds (system)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (system) of qemu-ga processes.

```console
rabe.qemu-ga.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: CPU seconds (user)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Total CPU seconds (user) of qemu-ga processes.

```console
rabe.qemu-ga.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Service load state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the configuration file of this unit has been loaded. The following states are currently defined: "loaded", "error", and "masked".

```console
rabe.qemu-ga.load_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["qemu-guest-agent.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.LoadState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: qemu-ga: Number of processes

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga processes.

```console
rabe.qemu-ga.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Memory usage (RSS)

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Memory usage of qemu-ga processes.

```console
rabe.qemu-ga.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Swap usage

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Swap usage of qemu-ga processes.

```console
rabe.qemu-ga.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Number of threads

![component: qemu-ga](https://img.shields.io/badge/component-qemu-ga-00c9bf)

Number of qemu-ga threads.

```console
rabe.qemu-ga.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[qemu-ga,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: qemu-ga: Unit file state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Encodes the install state of the unit file of FragmentPath. It currently knows the following states: "enabled", "enabled-runtime", "linked", "linked-runtime", "masked", "masked-runtime", "static", "disabled", and "invalid".

```console
rabe.qemu-ga.unitfile_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["qemu-guest-agent.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.UnitFileState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: qemu-ga: Uptime

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Number of seconds since unit entered the active state.

```console
rabe.qemu-ga.uptime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in uptime |
| History | 7d |
| Source item | `systemd.unit.get["qemu-guest-agent.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["data = JSON.parse(value);\nif (data.ActiveEnterTimestamp > data.ActiveExitTimestamp) {\n      return Math.floor(Date.now() / 1000) - Number(data.ActiveEnterTimestamp) / 1000000;\n}\nreturn null;\n"]` |

### Item: qemu-ga: unit info

![component: raw](https://img.shields.io/badge/component-raw-00c9bf) ![component: unit](https://img.shields.io/badge/component-unit-00c9bf)

Get unit info from systemd

```console
systemd.unit.get["qemu-guest-agent.service"]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: qemu-ga: Service is not running

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |
| Manual close | YES |

```console
last(/qemu-ga active/rabe.qemu-ga.active_state)<>1
```

### Trigger: qemu-ga: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running qemu-ga processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/qemu-ga active/rabe.qemu-ga.processes)<{$QEMUGA.THRESHOLD.MIN_PROC}
```

### Trigger: qemu-ga: has been restarted

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/qemu-ga active/rabe.qemu-ga.uptime)<=10m
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$QEMUGA.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:

```console
1
```

## Dashboards

The following Zabbix dashboards are included in this template.

* qemu-ga: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2025 [Radio Bern RaBe](http://www.rabe.ch)
