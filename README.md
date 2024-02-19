# rabe-zabbix

Collection of various [Zabbix](http://www.zabbix.com/) templates and
helper scripts created or used by [Radio Bern RaBe](http://rabe.ch/).

See below for an overview of our templates. We group our templates
similar to how Zabbix-out-of-the-box templates are grouped.

## Stacks

Every host within Zabbix gets a specific stack template assigned according
to its role. The stack exactly defines the setup of this host and will be
re-used if there is more than one host with the same role.

As an example, a host which servers a MediaWiki instance, will get the
stack template `MediaWiki Stack` assigned. The stack template
might include the operating system template `EL9 Stack`, the
application templates `Apache by HTTP`, `PHP-FPM by HTTP`
and `MariaDB by agent 2`.

This ensures great modularity, reusability and avoids unecessary
inheritance problems.

### Stacks: Applications

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| Apache with TLS by HTTP Stack |  | [✅](./Stacks/Applications/Apache_with_TLS_by_HTTP_Stack/6.4) |  |
| Nginx with TLS by HTTP Stack |  | [✅](./Stacks/Applications/Nginx_with_TLS_by_HTTP_Stack/6.4) |  |
| Songticker Stack |  | [✅](./Stacks/Applications/Songticker_Stack/6.4) |  |
| systemd Stack |  | [✅](./Stacks/Applications/systemd_Stack/6.4) |  |

### Stacks: Network devices

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| Netgear GS108Tv2 SNMPv2 | [✅](./Stacks/Network_devices/Netgear_GS108Tv2_SNMPv2/3.0) |  |  |
| Netgear M5300 Series SNMPv2 | [✅](./Stacks/Network_devices/Netgear_M5300_Series_SNMPv2/3.0) |  |  |

### Stacks: Operating systems

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| EL7 Stack |  | [✅](./Stacks/Operating_systems/EL7_Stack/6.4) |  |
| EL8 Stack |  | [✅](./Stacks/Operating_systems/EL8_Stack/6.4) |  |
| EL9 Stack |  | [✅](./Stacks/Operating_systems/EL9_Stack/6.4) |  |

### Stacks: Servers

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| EL7 KVM VM Stack |  | [✅](./Stacks/Servers/EL7_KVM_VM_Stack/6.4) |  |
| EL8 KVM VM Stack |  | [✅](./Stacks/Servers/EL8_KVM_VM_Stack/6.4) |  |
| EL9 KVM VM Stack |  | [✅](./Stacks/Servers/EL9_KVM_VM_Stack/6.4) |  |

## Templates

### Templates: Applications

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| Alarm Pinger | [✅](./Templates/Applications/Alarm_Pinger/3.0) |  |  |
| Apache HTTP Server | [✅](./Templates/Applications/Apache_HTTP_Server/3.0) |  |  |
| auditd | [✅](./Templates/Applications/auditd/3.0) | [✅](./Templates/Applications/auditd/6.4) |  |
| Axia ALSA Soundcard Driver for Livewire | [✅](./Templates/Applications/Axia_ALSA_Soundcard_Driver_for_Livewire/3.0) |  |  |
| BSNMP | [✅](./Templates/Applications/BSNMP/3.0) |  |  |
| candlepin-rhsmcertd |  | [✅](./Templates/Applications/candlepin-rhsmcertd/6.4) |  |
| CARP | [✅](./Templates/Applications/CARP/3.0) |  |  |
| certmonger |  | [✅](./Templates/Applications/certmonger/6.4) |  |
| chrony | [✅](./Templates/Applications/chrony/3.0) | [✅](./Templates/Applications/chrony/6.4) |  |
| Cronie | [✅](./Templates/Applications/Cronie/3.0) | [✅](./Templates/Applications/Cronie/6.4) |  |
| Darkice | [✅](./Templates/Applications/Darkice/3.0) |  |  |
| dpinger | [✅](./Templates/Applications/dpinger/3.0) |  |  |
| firewalld |  | [✅](./Templates/Applications/firewalld/6.4) |  |
| GlusterFS Client | [✅](./Templates/Applications/GlusterFS_Client/3.0) |  |  |
| GlusterFS Server | [✅](./Templates/Applications/GlusterFS_Server/3.0) |  |  |
| gssproxy | [✅](./Templates/Applications/gssproxy/3.0) | [✅](./Templates/Applications/gssproxy/6.4) |  |
| Icecast | [✅](./Templates/Applications/Icecast/3.0) |  |  |
| ISC DHCP daemon | [✅](./Templates/Applications/ISC_DHCP_daemon/3.0) |  |  |
| ISC DHCP Relay Agent | [✅](./Templates/Applications/ISC_DHCP_Relay_Agent/3.0) |  |  |
| JACK Audio Connection Kit sound server | [✅](./Templates/Applications/JACK_Audio_Connection_Kit_sound_server/3.0) |  |  |
| Journalbeat | [✅](./Templates/Applications/Journalbeat/3.0) |  |  |
| libvirtd | [✅](./Templates/Applications/libvirtd/3.0) |  |  |
| lighttpd | [✅](./Templates/Applications/lighttpd/3.0) |  |  |
| LVM | [✅](./Templates/Applications/LVM/3.0) |  |  |
| MD-RAID | [✅](./Templates/Applications/MD-RAID/3.0) |  |  |
| ntpd | [✅](./Templates/Applications/ntpd/3.0) |  |  |
| qemu-ga |  | [✅](./Templates/Applications/qemu-ga/6.4) |  |
| Rotter | [✅](./Templates/Applications/Rotter/3.0) |  |  |
| rpc.gssd |  | [✅](./Templates/Applications/rpc.gssd/6.4) |  |
| rsyslog |  | [✅](./Templates/Applications/rsyslog/6.4) |  |
| Songticker |  | [✅](./Templates/Applications/Songticker/6.4) |  |
| sssd |  | [✅](./Templates/Applications/sssd/6.4) |  |
| systemd-journald |  | [✅](./Templates/Applications/systemd-journald/6.4) |  |
| systemd-logind |  | [✅](./Templates/Applications/systemd-logind/6.4) |  |
| systemd-udevd |  | [✅](./Templates/Applications/systemd-udevd/6.4) |  |
| timedatectl | [✅](./Templates/Applications/timedatectl/3.0) | [✅](./Templates/Applications/timedatectl/6.4) |  |
| tuned |  | [✅](./Templates/Applications/tuned/6.4) |  |
| zabbix-agent | [✅](./Templates/Applications/zabbix-agent/3.0) |  |  |
| Zabbix unsupported items |  | [✅](./Templates/Applications/Zabbix_unsupported_items/6.4) |  |

### Templates: Network devices

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| SNMPv2 AVT AE1 DABPlus Go | [✅](./Templates/Network_devices/SNMPv2_AVT_AE1_DABPlus_Go/3.0) |  |  |
| SNMPv2 Generic | [✅](./Templates/Network_devices/SNMPv2_Generic/3.0) |  |  |
| SNMPv2 Interfaces HC | [✅](./Templates/Network_devices/SNMPv2_Interfaces_HC/3.0) |  |  |
| SNMPv2 Livewire | [✅](./Templates/Network_devices/SNMPv2_Livewire/3.0) |  |  |
| SNMPv2 Netgear Box Services | [✅](./Templates/Network_devices/SNMPv2_Netgear_Box_Services/3.0) |  |  |
| SNMPv2 Netgear Inventory | [✅](./Templates/Network_devices/SNMPv2_Netgear_Inventory/3.0) |  |  |
| SNMPv2 Netgear SNTP client | [✅](./Templates/Network_devices/SNMPv2_Netgear_SNTP_client/3.0) |  |  |
| SNMPv2 Netgear Switching | [✅](./Templates/Network_devices/SNMPv2_Netgear_Switching/3.0) |  |  |
| SNMPv2 UBNT-UniFi-MIB | [✅](./Templates/Network_devices/SNMPv2_UBNT-UniFi-MIB/3.0) |  |  |
| SNMPv2 UCD-SNMP-MIB load average | [✅](./Templates/Network_devices/SNMPv2_UCD-SNMP-MIB_load_average/3.0) |  |  |
| SNMPv2 UCD-SNMP-MIB memory | [✅](./Templates/Network_devices/SNMPv2_UCD-SNMP-MIB_memory/3.0) |  |  |

### Templates: Operating systems

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| FreeBSD | [✅](./Templates/Operating_systems/FreeBSD/3.0) |  |  |
| Linux | [✅](./Templates/Operating_systems/Linux/3.0) |  |  |

### Templates: Server hardware

| Name | 3.0 | 6.4 | 7.0 |
| ---- | --- | --- | --- |
| Drive Slot Sensors | [✅](./Templates/Server_hardware/Drive_Slot_Sensors/3.0) |  |  |
| Module Board Generic Sensors | [✅](./Templates/Server_hardware/Module_Board_Generic_Sensors/3.0) |  |  |
| Power Supply Generic Sensors | [✅](./Templates/Server_hardware/Power_Supply_Generic_Sensors/3.0) |  |  |
| Power Supply Sensors | [✅](./Templates/Server_hardware/Power_Supply_Sensors/3.0) |  |  |
| Sensor Discovery | [✅](./Templates/Server_hardware/Sensor_Discovery/3.0) |  |  |
| Supermicro SSG-6048R-E1CR24N | [✅](./Templates/Server_hardware/Supermicro_SSG-6048R-E1CR24N/3.0) |  |  |
| Supermicro X7DWU | [✅](./Templates/Server_hardware/Supermicro_X7DWU/3.0) |  |  |
| Threshold Sensors | [✅](./Templates/Server_hardware/Threshold_Sensors/3.0) |  |  |

## Overrides

In some cases we override the Zabbix out-of-the-box templates to
ensure they fit our use case. We publish the changed templates along
with a generated diff against its upstream version.

| Name | 6.4 | 7.0 |
| ---- | --- | --- |
| Apache by HTTP | [✅](./Overrides/Apache_by_HTTP/6.4) |  |
| Nginx by HTTP | [✅](./Overrides/Nginx_by_HTTP/6.4) |  |

## Zabbix Version Support

We primarily support versions of Zabbix we use in production.

| Version | Supported | Description |
| ------- | --------- | ----------- |
| 3.0 | ✅ | legacy RaBe environment |
| 6.4 | ✅ | for LTS preparation work until 7.0 is available |
| 7.0 | ✅ | once released |

## OS Version Support

Our Zabbix 3.0 template mainly template EL7 installations based on CentOS 7.
The 6.4+ templates aim to support both EL7 as well as EL9, with EL7 on
a best effort case (e.g. we don't workaround the lack of `timedatectl show`
on old distros, their timedatectl stays unmonitored).

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) if you want to contribute fixes or templates.

## Previous Versions

If you are looking for the documentation and tooling of the Zabbix 3.0 only
version of this repo, you may find them in [5d2dfb7](https://github.com/radiorabe/rabe-zabbix/tree/5d2dfb7d91cf84cb4b314f2a3c2b6dd69224cf20).

## License

This template collection is free software: you can redistribute it and/or
modify it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, version 3 of the License.

The contents of the `Overrides/` folder are released under the GNU
General Public License (GPL) version 2. You can redistribute it and/or
modify it under the terms of the GNU GPL as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
