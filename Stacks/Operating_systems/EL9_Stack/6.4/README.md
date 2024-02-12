# Zabbix Template: EL9 Stack

![class: stack](https://img.shields.io/badge/class-stack-00c9bf)

Base stack template for AlmaLinux 9 based systems.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Linked Templates

This Zabbix template depends on the following templates.

* auditd
* chrony
* firewalld
* Linux by Zabbix agent active
* rsyslog
* Systemd by Zabbix agent 2
* timedatectl
* tuned
* Zabbix unsupported items

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SYSTEMD.NAME.SERVICE.NOT_MATCHES}`

Filter of systemd service units by name

Default:
```
^(iscsi\.service|mdmonitor\.service|microcode\.service|multipathd\.service|udisks2\.service|selinux-autorelabel-mark\.service|iscsi-onboot\.service|vgauthd\.service|vmtoolsd\.service|loadmodules\.service|timedatex\.service)$
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
