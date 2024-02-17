# Zabbix Template: candlepin-rhsmcertd

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: candlepin-rhsmcertd](https://img.shields.io/badge/target-candlepin-rhsmcertd-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [candlepin-rhsmcertd](https://github.com/candlepin/subscription-manager/blob/main/src/daemons/rhsmcertd.c).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: candlepin-rhsmcertd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about candlepin-rhsmcertd processes

```console
proc.get[rhsmcertd,root,,summary]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: candlepin-rhsmcertd: Unit active state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the unit is currently active or not. The following states are currently defined: "active", "reloading", "inactive", "failed", "activating", and "deactivating".

```console
rabe.candlepin-rhsmcertd.active_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["rhsmcertd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.ActiveState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: candlepin-rhsmcertd: CPU seconds (system)

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Total CPU seconds (system) of candlepin-rhsmcertd processes.

```console
rabe.candlepin-rhsmcertd.cputime_system
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: CPU seconds (user)

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Total CPU seconds (user) of candlepin-rhsmcertd processes.

```console
rabe.candlepin-rhsmcertd.cputime_user
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: Service load state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

State value that reflects whether the configuration file of this unit has been loaded. The following states are currently defined: "loaded", "error", and "masked".

```console
rabe.candlepin-rhsmcertd.load_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["rhsmcertd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.LoadState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: candlepin-rhsmcertd: Number of processes

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Number of candlepin-rhsmcertd processes.

```console
rabe.candlepin-rhsmcertd.processes
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: Memory usage (RSS)

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Memory usage of candlepin-rhsmcertd processes.

```console
rabe.candlepin-rhsmcertd.rss
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: Swap usage

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Swap usage of candlepin-rhsmcertd processes.

```console
rabe.candlepin-rhsmcertd.swap
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: Number of threads

![component: candlepin-rhsmcertd](https://img.shields.io/badge/component-candlepin-rhsmcertd-00c9bf)

Number of candlepin-rhsmcertd threads.

```console
rabe.candlepin-rhsmcertd.threads
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rhsmcertd,root,,summary]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: candlepin-rhsmcertd: Unit file state

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Encodes the install state of the unit file of FragmentPath. It currently knows the following states: "enabled", "enabled-runtime", "linked", "linked-runtime", "masked", "masked-runtime", "static", "disabled", and "invalid".

```console
rabe.candlepin-rhsmcertd.unitfile_state
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `systemd.unit.get["rhsmcertd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.UnitFileState.state"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: candlepin-rhsmcertd: Uptime

![component: service](https://img.shields.io/badge/component-service-00c9bf)

Number of seconds since unit entered the active state.

```console
rabe.candlepin-rhsmcertd.uptime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT in uptime |
| History | 7d |
| Source item | `systemd.unit.get["rhsmcertd.service"]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JAVASCRIPT | `["data = JSON.parse(value);\nif (data.ActiveEnterTimestamp > data.ActiveExitTimestamp) {\n      return Math.floor(Date.now() / 1000) - Number(data.ActiveEnterTimestamp) / 1000000;\n}\nreturn null;\n"]` |

### Item: candlepin-rhsmcertd: unit info

![component: raw](https://img.shields.io/badge/component-raw-00c9bf) ![component: unit](https://img.shields.io/badge/component-unit-00c9bf)

Get unit info from systemd

```console
systemd.unit.get["rhsmcertd.service"]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: candlepin-rhsmcertd: Service is not running

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |
| Manual close | YES |

```console
last(/candlepin-rhsmcertd/rabe.candlepin-rhsmcertd.active_state)<>1
```

### Trigger: candlepin-rhsmcertd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running candlepin-rhsmcertd processes.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/candlepin-rhsmcertd/rabe.candlepin-rhsmcertd.processes)<{$CANDLEPINRHSMCERTD.THRESHOLD.MIN_PROC}
```

### Trigger: candlepin-rhsmcertd: has been restarted

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/candlepin-rhsmcertd/rabe.candlepin-rhsmcertd.uptime)<=10m
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$CANDLEPINRHSMCERTD.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:

```console
1
```

## Dashboards

The following Zabbix dashboards are included in this template.

* candlepin-rhsmcertd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
