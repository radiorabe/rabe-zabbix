# Zabbix Template: certmonger

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: certmonger](https://img.shields.io/badge/target-certmonger-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Monitoring of [certmonger](https://www.freeipa.org/page/Certmonger).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: certmonger: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about certmonger processes

```console
proc.get[certmonger,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: certmonger: Unit active state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the unit is currently active or not. The following states are currently defined: "active", "reloading", "inactive", "failed", "activating", and "deactivating".

```console
rabe.certmonger.active_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["certmonger.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.ActiveState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: certmonger: CPU seconds (system)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (system) of certmonger processes.

```console
rabe.certmonger.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: CPU seconds (user)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (user) of certmonger processes.

```console
rabe.certmonger.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Service load state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the configuration file of this unit has been loaded. The following states are currently defined: "loaded", "error", and "masked".

```console
rabe.certmonger.load_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["certmonger.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.LoadState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: certmonger: Number of processes

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger processes.

```console
rabe.certmonger.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Memory usage (RSS)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Memory usage of certmonger processes.

```console
rabe.certmonger.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Swap usage

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Swap usage of certmonger processes.

```console
rabe.certmonger.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Number of threads

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger threads.

```console
rabe.certmonger.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Unit file state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Encodes the install state of the unit file of FragmentPath. It currently knows the following states: "enabled", "enabled-runtime", "linked", "linked-runtime", "masked", "masked-runtime", "static", "disabled", and "invalid".

```console
rabe.certmonger.unitfile_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["certmonger.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.UnitFileState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: certmonger: Uptime

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Number of seconds since unit entered the active state.

```console
rabe.certmonger.uptime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in uptime |
| History | 7d |
| Source item | `systemd.unit.get["certmonger.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["data = JSON.parse(value);\nif (data.ActiveEnterTimestamp > data.ActiveExitTimestamp) {\n      return Math.floor(Date.now() / 1000) - Number(data.ActiveEnterTimestamp) / 1000000;\n}\nreturn null;\n"]` |

### Item: certmonger: unit info

![component: raw](https://img.shields.io/badge/component-raw-00c9bf) ![component: unit](https://img.shields.io/badge/component-unit-00c9bf)

Get unit info from systemd

```console
systemd.unit.get["certmonger.service"]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: certmonger: Service is not running

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |
| Manual close | YES |

```console
last(/certmonger/rabe.certmonger.active_state)<>1
```

### Trigger: certmonger: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running certmonger processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/certmonger/rabe.certmonger.processes)<{$CERTMONGER.THRESHOLD.MIN_PROC}
```

### Trigger: certmonger: has been restarted

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/certmonger/rabe.certmonger.uptime)<=10m
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$CERTMONGER.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:

```console
1
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
