# Zabbix Template: timedatectl

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: timedatectl](https://img.shields.io/badge/target-timedatectl-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Keeps track of the time and date subsystem by running timedatectl status.

Needs the following configuration:
```
AllowKey=system.run[/usr/bin/timedatectl show]
```

See [here](https://www.freedesktop.org/software/systemd/man/latest/timedatectl.html)
for more information about timedatectl.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: timedatectl: NTP service status

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

NTP service status

```console
rabe.timedatectl.status.ntp_service
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/timedatectl show]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| REGEX | `["NTP=(.*)", "\\1"]` |
| JAVASCRIPT | `["return {\"yes\": 1, \"no\": 0}[value]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: timedatectl: RTC in local TZ

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Is the RTC in local TZ?

```console
rabe.timedatectl.status.rtc_in_local_tz
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/timedatectl show]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| REGEX | `["LocalRTC=(.*)", "\\1"]` |
| JAVASCRIPT | `["return {\"yes\": 1, \"no\": 0}[value]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: timedatectl: System clock synchronized

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Is the system clock synchronized?

```console
rabe.timedatectl.status.system_clock_synchronized
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `system.run[/usr/bin/timedatectl show]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| REGEX | `["NTPSynchronized=(.*)", "\\1"]` |
| JAVASCRIPT | `["return {\"yes\": 1, \"no\": 0}[value]"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: timedatectl: Time zone

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Time zone

```console
rabe.timedatectl.status.time_zone
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `system.run[/usr/bin/timedatectl show]` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| REGEX | `["Timezone=(.*)", "\\1"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["1d"]` |

### Item: timedatectl: Get status

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get output from timedatectl status.

```console
system.run[/usr/bin/timedatectl show]
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

## Triggers

### Trigger: timedatectl: NTP not active

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

The NTP service is not active, check `timedatectl status` for more info.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |

```console
last(/timedatectl/rabe.timedatectl.status.ntp_service)<>1
```

### Trigger: timedatectl: RTC not in local TZ

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

The RTC not in local TZ, check `timedatectl status` for more info.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |

```console
last(/timedatectl/rabe.timedatectl.status.rtc_in_local_tz)<>0
```

### Trigger: timedatectl: NTP not synchronized

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf) ![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

NTP is not in sync, check `timedatectl status` for more info.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |

```console
last(/timedatectl/rabe.timedatectl.status.system_clock_synchronized)<>1
```

### Trigger: timedatectl: NTP not synchronized for more than {$TIMEDATECTL_MAX_NO_SYNC_TIME}

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

NTP is not in sync, check `timedatectl status` for more info.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |

```console
last(/timedatectl/rabe.timedatectl.status.system_clock_synchronized,{$TIMEDATECTL_MAX_NO_SYNC_TIME})<1
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$TIMEDATECTL_MAX_NO_SYNC_TIME}`

How long can time be out if sync before we care?

Default:

```console
60m
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2025 [Radio Bern RaBe](http://www.rabe.ch)
