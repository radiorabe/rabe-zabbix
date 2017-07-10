## UserParameters

The following user parameters are available within [`rabe.lvm.conf`](userparameters/rabe.lvm.conf)

| Key | Description |
| --- | ----------- |
| `rabe.lvm.pvs.discovery` | Discovery rule for getting a list of all available physical volumes (PV) |
| `rabe.lvm.vgs.discovery` | Discovery rule for getting a list of all available volume groups (VG) |
| `rabe.lvm.lvs.discovery` | Discovery rule for getting a list of all available logical volumes (LV) |
| `rabe.lvm.pvs.value[<pv name>,<option>]` | Get information about a physical volume (PV) |
| `rabe.lvm.vgs.value[<vg name>,<option>]` | Get information about a volume group (VG) |
| `rabe.lvm.lvs.value[<lv path>,<option>]` | Get information about a logical volume (LV) |

### Commands and log files for debugging
The following commands might be helpful for debugging:
```bash
# list the available sudo rules for the zabbix user
su -l -s /bin/bash -c 'sudo -l' zabbix

# list LVM physical volumes
su -l \
   -s /bin/bash \
   -c '/usr/bin/sudo /sbin/pvs --noheadings --options pv_name,pv_uuid,pv_fmt' \
   zabbix

# list LVM volume groups
su -l \
   -s /bin/bash \
   -c '/usr/bin/sudo /sbin/vgs --noheadings --options vg_name,vg_uuid,vg_fmt' \
   zabbix

# list LVM logical volumes
su -l \
   -s /bin/bash \
   -c '/usr/bin/sudo /sbin/lvs --noheadings --options lv_full_name,lv_uuid,segtype,lv_role,lv_name,vg_name,lv_path' \
   zabbix
```

The following logs might contain helpful hints
* sudo related messages: `journalctl -r /usr/bin/sudo`
* SELinux related messages: `/var/log/audit/audit.log`
