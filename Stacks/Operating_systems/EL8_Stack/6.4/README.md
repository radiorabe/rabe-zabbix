# EL8 Stack

![class: stack](https://img.shields.io/badge/class-stack) 
Base stack template for CentOS 8 Stream based systems.

Managed by <https://github.com/radiorabe/ansible-collection-rabe_zabbix/>.


## Dependant Templates

This Zabbix template depends on the following templates.

* Linux by Zabbix agent active
* Systemd by Zabbix agent 2
* Zabbix unsupported items

## Macros

The following Zabbix macros are configured via this template.

| Macro | Value | Description |
| ----- | ----- | ----------- |
| `{$SYSTEMD.NAME.SERVICE.NOT_MATCHES}` | `^(iscsi\.service|mdmonitor\.service|microcode\.service|multipathd\.service|udisks2\.service|selinux-autorelabel-mark\.service|iscsi-onboot\.service|vgauthd\.service|vmtoolsd\.service|loadmodules\.service)$` | Filter of systemd service units by name |

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
