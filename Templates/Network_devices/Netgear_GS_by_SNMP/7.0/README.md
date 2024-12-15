# Zabbix Template: Netgear GS by SNMP

![class: network](https://img.shields.io/badge/class-network-00c9bf) ![target: netgear](https://img.shields.io/badge/target-netgear-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Grabs additional data that is currently not available from the Zabbix-out-of-the-box template.

Deactivates cpu0's triggers since they are not too meaningful out of the box.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Linked Templates

This Zabbix template depends on the following templates.

* Netgear Fastpath by SNMP
* Zabbix unsupported items

## Items

### Item: GS Hardware serial number

![component: system](https://img.shields.io/badge/component-system-00c9bf)

MIB: FASTPATH-SWITCHING-MIB
Serial number of the switch

```console
rabe.system.hw.serialnumber
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | SNMP_AGENT |
| Value type | CHAR |
| History | 7d |

## Triggers

### Trigger: GS Device has been replaced

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

Device serial number has changed. Acknowledge to close the problem manually.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | INFO |
| Manual close | YES |

```console
last(/Netgear GS by SNMP/rabe.system.hw.serialnumber,#1)<>last(/Netgear GS by SNMP/rabe.system.hw.serialnumber,#2) and length(last(/Netgear GS by SNMP/rabe.system.hw.serialnumber))>0
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$IFCONTROL:"cpu"}`

Ignore state for cpu interface

Default:

```console
0
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
