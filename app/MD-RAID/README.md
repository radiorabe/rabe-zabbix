# Zabbix MD-RAID monitoring

Monitoring of Linux [MD-RAID](https://raid.wiki.kernel.org) devices (aka Linux
Software RAID).

There are [user parameters](#userparameters) with custom [low-level
discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
rules for detecting and monitoring the available array devices (MD) as well as
the underlying component devices (RD). The [sysfs md
interface](https://www.kernel.org/doc/html/latest/admin-guide/md.html#md-devices-in-sysfs)
is used for discovery and monitoring of the device parameters.

## Usage
1. Install the [`rabe.md-raid.conf`](userparameters/rabe.md-raid.conf) Zabbix
   user parameters into your Zabbix agent's
   [`Include`](https://www.zabbix.com/documentation/3.0/manual/appendix/config/zabbix_agentd)
   directory (usually `/etc/zabbix/zabbix_agentd.d`).
4. Import the
   [`Template_App_MD-RAID_active.xml`](Template_App_MD-RAID_active.xml) into
   your Zabbix server.
5. Add the template to you host (or stack template)
6. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App MD-RAID active
Application template for monitoring Linux multi device RAID (MD-RAID).
### Discovery
#### Component device (RD) discovery (`rabe.raid.md.component-device.discovery`)
Low-Level discovery of component devices (RD). Mapping between raid devices and their corresponding component devices.

Returns the following macros for each available RD device:
* `{#MD_RAID_RAID_DEV_NAME}`
  * RAID device (MD) name
  * Example: `md0`
* `{#MD_RAID_COMPONENT_DEV_NAME}`
  * Component device (RD) name
  * Example: `rd1`
##### Item Prototypes
* Block device name of MD $1 RD $2 device (`rabe.raid.md.component-device.block-dev[{#MD_RAID_RAID_DEV_NAME},{#MD_RAID_COMPONENT_DEV_NAME}]`)  
  Block device name of a specific component device (RD), according to the symlink target of `/sys/block/<MD-NAME>/md/<RD-NAME>/block`.
* Read errors of MD {#MD_RAID_RAID_DEV_NAME} RD {#MD_RAID_COMPONENT_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/{#MD_RAID_COMPONENT_DEV_NAME}/errors]`)  
  Count of read errors of a specific component device (RD), according to `/sys/block/<MD-NAME>/md/<RD-NAME>/errors`.
* State of MD {#MD_RAID_RAID_DEV_NAME} RD {#MD_RAID_COMPONENT_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/{#MD_RAID_COMPONENT_DEV_NAME}/state]`)  
  The current state of a specific component device (RD), according to `/sys/block/<MD-NAME>/md/<RD-NAME>/state`.
##### Trigger Prototypes
* High: RAID component device MD {#MD_RAID_RAID_DEV_NAME} RD {#MD_RAID_COMPONENT_DEV_NAME} is in {ITEM.VALUE1} state on {HOST.NAME}
  ```
  {Template App MD-RAID active:vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/{#MD_RAID_COMPONENT_DEV_NAME}/state].str(in_sync)}=0
  ```
  The component device (RD) `{#MD_RAID_COMPONENT_DEV_NAME}`  is not a fully in-sync member of the array of the RAID device (MD) `{#MD_RAID_RAID_DEV_NAME}`.
#### RAID device (MD) discovery (`rabe.raid.md.raid-device.discovery`)
Low-Level discovery of RAID devices (MD) 

Returns the following macros for each available MD device:
* `{#MD_RAID_RAID_DEV_NAME{}`
  * RAID device name
  * Example: `md0`
##### Item Prototypes
* Array state of MD {#MD_RAID_RAID_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/array_state]`)  
  The current array state of a specific raid device (MD), according to `/sys/block/<MD-NAME>/md/array_state`.
* Number of degraded devices within MD {#MD_RAID_RAID_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/degraded]`)  
  The number of degraded devices within a raid device (MD), according to `/sys/block/<MD-NAME>/md/degraded`.
* RAID level of MD {#MD_RAID_RAID_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/level]`)  
  RAID level of a specific raid device (MD), according to `/sys/block/<MD-NAME>/md/level`.
* Number of devices within MD {#MD_RAID_RAID_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/raid_disks]`)  
  The number of devices within a raid device (MD), according to `/sys/block/<MD-NAME>/md/raid_disks`.
* Sync action of MD {#MD_RAID_RAID_DEV_NAME} device (`vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/sync_action]`)  
  The current sync action (for rebuild or redundancy check processes) of a specific raid device (MD), according to `/sys/block/<MD-NAME>/md/sync_action`.
##### Trigger Prototypes
* High: RAID array device MD {#MD_RAID_RAID_DEV_NAME} has $1 degraded device(s) on {HOST.NAME}
  ```
  {Template App MD-RAID active:vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/degraded].last()}>0
  ```
  The raid device (MD) `{#MD_RAID_COMPONENT_DEV_NAME}` has one or more degraded component devices within its array.
* High: RAID array device MD {#MD_RAID_RAID_DEV_NAME} has failed on {HOST.NAME}
  ```
  {Template App MD-RAID active:vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/level].str(faulty)}=1
  ```
  The raid device (MD) `{#MD_RAID_COMPONENT_DEV_NAME}` has failed.
* Information: RAID array device MD {#MD_RAID_RAID_DEV_NAME} is in {ITEM.VALUE1} sync action on {HOST.NAME}
  ```
  {Template App MD-RAID active:vfs.file.contents[/sys/block/{#MD_RAID_RAID_DEV_NAME}/md/sync_action].str(idle)}=0
  ```
  The raid device (MD) `{#MD_RAID_COMPONENT_DEV_NAME}` currently runs a re-sync, recover or redundancy check/repair action.
## UserParameters

The following user parameters are available within
[`rabe.md-raid.conf`](userparameters/rabe.md-raid.conf) (including some
in-depth parameter description):

| Key | Description |
| --- | ----------- |
| `rabe.raid.md.raid-device.discovery` | Discovery rule for getting a list of all raid devices (MD) |
| `rabe.raid.md.component-device.discovery` | Discovery rule for getting a list of all component devices (RD) |
| `rabe.raid.md.component-device.block-dev[<md device name>,<rd device name>]` | Block device name of a specific component device (RD) |

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
