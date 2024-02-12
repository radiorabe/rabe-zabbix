# Zabbix Template: EL7 Stack

![class: stack](https://img.shields.io/badge/class-stack-00c9bf)

Base stack template for CentOS 7 based systems.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Linked Templates

This Zabbix template depends on the following templates.

* auditd
* firewalld
* Linux by Zabbix agent active
* rsyslog
* sssd
* Systemd by Zabbix agent 2
* tuned
* Zabbix unsupported items

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SYSTEMD.NAME.SERVICE.NOT_MATCHES}`

Filter of systemd service units by name

Default:
```
^(iscsi\.service|mdmonitor\.service|microcode\.service|multipathd\.service|udisks2\.service|selinux-autorelabel-mark\.service|iscsi-onboot\.service|vgauthd\.service|vmtoolsd\.service|abrt-vmcore\.service|dmraid-activation\.service|abrt-xorg\.service|rhel-configure\.service|systemd-readahead-collect\.service|rhel-autorelabel\.service|irqbalance\.service|rhel-loadmodules\.service|systemd-readahead-replay\.service|rhel-autorelabel-mark\.service|timedatex\.service)$
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
