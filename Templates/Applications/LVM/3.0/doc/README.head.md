Monitoring of Linux [Logical Volumen
Management](https://www.sourceware.org/lvm2/) (LVM).

There are [user parameters](#userparameters) with custom [low-level
discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
rules for detecting and monitoring the available LVM physical volumes (PVs),
volume groups (VGs) and logical volumes (LVs).

The following logical volume types are currently supported:
* Linear volumes
* Thin volumes
* Thin-pool volumes
* Thick snapshot volumes
* Thin snapshot volumes

The following logical volume types are not yet supported (contributions are
welcome):
* Striped volumes
* RAID volumes
* Cache volumes
