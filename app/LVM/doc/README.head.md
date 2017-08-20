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

## Usage
1. Install the provided [`rabezbx-lvm`](sudoers.d/rabezbx-lvm)
   [sudoers](https://www.sudo.ws/man/1.8.20/sudoers.man.html#SUDOERS_FILE_FORMAT)
   droplet into the `/etc/sudoers.d` directory, to allow the `zabbix` user to
   execute the LVM report commands (`pvs`, `vgs` and `lvs`) with root
   privileges.
2. If you have SELinux active, ensure that the Zabbix agent is allowed to
   execute the LVM report commands via sudo. The SELinux type enforcement file
   [`rabezbxlvm.te`](selinux/rabezbxlvm.te) contains the necessary policies
   (tested on CentOS 7) which can be loaded as follows:
   ```bash
   checkmodule -M -m -o rabezbxlvm.mod rabezbxlvm.te
   semodule_package -o rabezbxlvm.pp -m rabezbxlvm.mod
   semodule -i rabezbxlvm.pp
   ```
3. Install the [`rabe.lvm.conf`](userparameters/rabe.lvm.conf) Zabbix user
   parameters into your Zabbix agent's
   [`Include`](https://www.zabbix.com/documentation/3.0/manual/appendix/config/zabbix_agentd)
   directory (usually `/etc/zabbix/zabbix_agentd.d`).
4. Import the [`Template_App_LVM_active.xml`](Template_App_LVM_active.xml) into your Zabbix server.
5. Add the template to your host (or stack template)
6. Check if new data arrives
