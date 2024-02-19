## Usage
### CentOS RPM installation
1. Install the [`rabe-zabbix`](../../README.md#rpm-packages) RPM (which
   contains the required sudoers droplets, SELinux policies as well as the
   actual Zabbix user parameters).
2. Import the [`Template_App_LVM_active.xml`](Template_App_LVM_active.xml) into
   your Zabbix server (click on the `Raw` button to download).
3. Add the template to your host (or stack template)
4. Check if new data arrives

### Manual installation
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
4. Import the [`Template_App_LVM_active.xml`](Template_App_LVM_active.xml) into
   your Zabbix server (click on the `Raw` button to download).
5. Add the template to your host (or stack template)
6. Check if new data arrives
