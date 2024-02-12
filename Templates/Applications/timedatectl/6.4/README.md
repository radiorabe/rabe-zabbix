# Zabbix Template: timedatectl

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: timedatectl](https://img.shields.io/badge/target-timedatectl-00c9bf)

Keeps track of the time and date subsystem by running timedatectl status.

Needs the following configuration:
```
AllowKey=system.run[/usr/bin/timedatectl show]
```

Managed by <https://github.com/radiorabe/rabe-zabbix>.


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$TIMEDATECTL_MAX_NO_SYNC_TIME}`

How long can time be out if sync before we care?

Default:
```
60m
```

## Items

### Item: timedatectl: NTP service status

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

NTP service status
```
rabe.timedatectl.status.ntp_service
```

### Item: timedatectl: RTC in local TZ

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Is the RTC in local TZ?
```
rabe.timedatectl.status.rtc_in_local_tz
```

### Item: timedatectl: System clock synchronized

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Is the system clock synchronized?
```
rabe.timedatectl.status.system_clock_synchronized
```

### Item: timedatectl: Time zone

![component: timedatectl](https://img.shields.io/badge/component-timedatectl-00c9bf)

Time zone
```
rabe.timedatectl.status.time_zone
```

### Item: timedatectl: Get status

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get output from timedatectl status.
```
system.run[/usr/bin/timedatectl show]
```

## Triggers

## Trigger: timedatectl: NTP not active

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

The NTP service is not active, check `timedatectl status` for more info.

Priority: WARNING

```
last(/timedatectl/rabe.timedatectl.status.ntp_service)<>1
```

## Trigger: timedatectl: RTC not in local TZ

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

The RTC not in local TZ, check `timedatectl status` for more info.

Priority: INFO

```
last(/timedatectl/rabe.timedatectl.status.rtc_in_local_tz)<>0
```

## Trigger: timedatectl: NTP not synchronized

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

NTP is not in sync, check `timedatectl status` for more info.

Priority: INFO

```
last(/timedatectl/rabe.timedatectl.status.system_clock_synchronized)<>1
```

## Trigger: timedatectl: NTP not synchronized for more than {$TIMEDATECTL_MAX_NO_SYNC_TIME}

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

NTP is not in sync, check `timedatectl status` for more info.

Priority: WARNING

```
last(/timedatectl/rabe.timedatectl.status.system_clock_synchronized,{$TIMEDATECTL_MAX_NO_SYNC_TIME})<1
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
