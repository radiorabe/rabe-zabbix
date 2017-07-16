# Zabbix LVM monitoring

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
5. Add the template to you host (or stack template)
6. Check if new data arrives

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template App LVM active
Application template for monitoring Linux Logical Volumen Management (LVM)
### Macros
* `{$LVM_LV_META_DATA_FREE_HIGH_THRESHOLD}` (default: 3G)
* `{$LVM_LV_META_DATA_FREE_WARNING_THRESHOLD}` (default: 5G)
* `{$LVM_LV_META_DATA_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$LVM_LV_META_DATA_PFREE_WARNING_THRESHOLD}` (default: 10)
* `{$LVM_LV_POOL_DATA_FREE_HIGH_THRESHOLD}` (default: 100G)
* `{$LVM_LV_POOL_DATA_FREE_WARNING_THRESHOLD}` (default: 150G)
* `{$LVM_LV_POOL_DATA_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$LVM_LV_POOL_DATA_PFREE_WARNING_THRESHOLD}` (default: 10)
* `{$LVM_LV_SNAPSHOT_DATA_FREE_HIGH_THRESHOLD}` (default: 100G)
* `{$LVM_LV_SNAPSHOT_DATA_FREE_WARNING_THRESHOLD}` (default: 150G)
* `{$LVM_LV_SNAPSHOT_DATA_PFREE_HIGH_THRESHOLD}` (default: 5)
* `{$LVM_LV_SNAPSHOT_DATA_PFREE_WARNING_THRESHOLD}` (default: 10)
### Discovery
#### LVM logical linear volumes discovery (`rabe.lvm.lvs.discovery[linear]`)
Low-Level discovery of linear LVM logical volumes (LV)

Returns the following macros for each available LV:
* `{#LVM_LV_FULL_NAME}`
  * Logical volume full name (`lvs -o lv_full_name`)
  * Example: `vg_example_01/lv_example_01`
* `{#LVM_LV_UUID}`
  * Logical volume UUID (`lvs -o lv_uuid`)
  * Example. `dxi5Hw-Xo2m-SAVi-ypZh-QO4I-krpI-sR3N67`
* `{#LVM_LV_TYPE}`
  * Logical volume segment type (`lvs -o segtype`)
  * Example: `linear`, `thin`, `thin-pool`
* `{#LVM_LV_ROLE}`
  * Logical volume role (`lvs -o lv_role`)
  * Example: `public`, `private`, `public,snapshot,thicksnapshot`
* `{#LVM_LV_NAME}`
  * Logical volume name (`lvs -o lv_name`)
  * Example: `lv_example_01`
* `{#LVM_LV_VG_NAME}`
  * Volume group name (`lvs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_LV_PATH}`
  * Full pathname for LV. Blank for internal LVs. (`lvs -o lv_path`)
  * Example: `/dev/vg_example_01/lv_example_01`
##### Item Prototypes
* Active state of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,linear]`)  
  Active state of an linear LVM logical volume (LV).
* Size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_size,linear]`)  
  The size of a linear LVM logical volume (LV).
##### Trigger Prototypes
* High: LVM linear LV {#LVM_LV_FULL_NAME} is not active ({ITEM.VALUE1}) on {HOSTNAME}
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,linear].str(active)}=0
  ```
  The linear LVM logical volume is not in state "active", which is most likely a sign of a problem.
#### LVM logical thick snapshot volumes discovery (`rabe.lvm.lvs.discovery[thicksnapshot]`)
Low-Level discovery of a thick provisioned snapshot LVM logical volumes (LV)

Returns the following macros for each available LV:
* `{#LVM_LV_FULL_NAME}`
  * Logical volume full name (`lvs -o lv_full_name`)
  * Example: `vg_example_01/lv_example_01`
* `{#LVM_LV_UUID}`
  * Logical volume UUID (`lvs -o lv_uuid`)
  * Example. `dxi5Hw-Xo2m-SAVi-ypZh-QO4I-krpI-sR3N67`
* `{#LVM_LV_TYPE}`
  * Logical volume segment type (`lvs -o segtype`)
  * Example: `linear`, `thin`, `thin-pool`
* `{#LVM_LV_ROLE}`
  * Logical volume role (`lvs -o lv_role`)
  * Example: `public`, `private`, `public,snapshot,thicksnapshot`
* `{#LVM_LV_NAME}`
  * Logical volume name (`lvs -o lv_name`)
  * Example: `lv_example_01`
* `{#LVM_LV_VG_NAME}`
  * Volume group name (`lvs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_LV_PATH}`
  * Full pathname for LV. Blank for internal LVs. (`lvs -o lv_path`)
  * Example: `/dev/vg_example_01/lv_example_01`
##### Item Prototypes
* Active state of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thicksnapshot]`)  
  Active state of a thick provisioned LVM snapshot.
* Size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_size,thicksnapshot]`)  
  The size of a thick provisioned snapshot LVM logical volume (LV).
* Origin of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},origin,thicksnapshot]`)  
  Origin device of a thick provisioned LVM snapshot.
* Free snapshot data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_free,thicksnapshot]`)  
  The free snapshot data of a thick provisioned LVM snapshot in bytes.
* Free snapshot data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_free_percent,thicksnapshot]`)  
  The percentage of free snapshot data of a thick provisioned LVM snapshot.
* Allocated snapshot data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_percent,thicksnapshot]`)  
  The percentage of allocated snapshot data of a thick provisioned LVM snapshot in bytes.
* Allocated snapshot data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_used,thicksnapshot]`)  
  The allocated snapshot data of a thick provisioned LVM snapshot in bytes.
##### Trigger Prototypes
* Warning: LVM thick snapshot allocation {HOST.NAME}:[{#LVM_LV_FULL_NAME} is high (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_free,thicksnapshot].last()} < {$LVM_LV_SNAPSHOT_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_percent,thicksnapshot].last()} < {$LVM_LV_SNAPSHOT_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free snapshot data of the LVM thick provisioned snapshot is below `{$LVM_LV_SNAPSHOT_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` and `{$LVM_LV_SNAPSHOT_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent. The snapshot will turn invalid soon.
* High: LVM thick snapshot allocation {HOST.NAME}:[{#LVM_LV_FULL_NAME} is very high (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_free,thicksnapshot].last()} < {$LVM_LV_SNAPSHOT_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},snap_percent,thicksnapshot].last()} < {$LVM_LV_SNAPSHOT_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free snapshot data of the LVM thick provisioned snapshot is below `{$LVM_LV_SNAPSHOT_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` and `{$LVM_LV_SNAPSHOT_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent. The snapshot will turn invalid very soon.
* High: LVM thick snapshot LV {#LVM_LV_FULL_NAME} is not active ({ITEM.VALUE1}) on {HOSTNAME}
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thicksnapshot].str(active)}=0
  ```
  The thick provisioned LVM snapshot is not in state "active", which is most likely a sign of a problem.
#### LVM logical thin-pool volumes discovery (`rabe.lvm.lvs.discovery[thin-pool]`)
Low-Level discovery of thin-pool LVM logical volumes (LV)

Returns the following macros for each available LV:
* `{#LVM_LV_FULL_NAME}`
  * Logical volume full name (`lvs -o lv_full_name`)
  * Example: `vg_example_01/lv_example_01`
* `{#LVM_LV_UUID}`
  * Logical volume UUID (`lvs -o lv_uuid`)
  * Example. `dxi5Hw-Xo2m-SAVi-ypZh-QO4I-krpI-sR3N67`
* `{#LVM_LV_TYPE}`
  * Logical volume segment type (`lvs -o segtype`)
  * Example: `linear`, `thin`, `thin-pool`
* `{#LVM_LV_ROLE}`
  * Logical volume role (`lvs -o lv_role`)
  * Example: `public`, `private`, `public,snapshot,thicksnapshot`
* `{#LVM_LV_NAME}`
  * Logical volume name (`lvs -o lv_name`)
  * Example: `lv_example_01`
* `{#LVM_LV_VG_NAME}`
  * Volume group name (`lvs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_LV_PATH}`
  * Full pathname for LV. Blank for internal LVs. (`lvs -o lv_path`)
  * Example: `/dev/vg_example_01/lv_example_01`
##### Item Prototypes
* Free pool data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free,thin-pool]`)  
  The free pool data of a thin-pool LVM logical volume (LV) in bytes.
* Free pool data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free_percent,thin-pool]`)  
  The percentage of free pool data of a thin-pool LVM logical volume (LV).
* Allocated pool data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_percent,thin-pool]`)  
  The percentage of allocated data of a thin-pool LVM logical volume (LV).
* Allocated pool data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_used,thin-pool]`)  
  The allocated pool data of a thin-pool LVM logical volume (LV) in bytes.
* Active state of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thin-pool]`)  
  Active state of a thin-pool LVM logical volume (LV).
* Metadata size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_metadata_size,thin-pool]`)  
  The size of the LV that holds the metadata of a thin-pool LVM logical volume (LV).
* Size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_size,thin-pool]`)  
  The size of a thin-pool LVM logical volume (LV).
* Full behavior of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_when_full,thin-pool]`)  
  The behaviour of thin-pool LVM logical volume (LV) when full.
* Free meta data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free,thin-pool]`)  
  The free meta data of a thin-pool LVM logical volume (LV) in bytes.
* Free meta data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free_percent,thin-pool]`)  
  The percentage of free metadata of a thin-pool LVM logical volume (LV).
* Allocated meta data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_percent,thin-pool]`)  
  The percentage of allocated metadata of a thin-pool LVM logical volume (LV).
* Allocated meta data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_used,thin-pool]`)  
  The allocated meta data of a thin-pool LVM logical volume (LV) in bytes.
* Number of thin volumes in $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},thin_count,thin-pool]`)  
  The number of thin volumes in this pool.
##### Trigger Prototypes
* Warning: LVM thin-pool free meta data on {HOST.NAME}:[{#LVM_LV_FULL_NAME} is low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free,thin-pool].last()} < {$LVM_LV_META_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"} 

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free_percent,thin-pool].last()} < {$LVM_LV_META_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free meta data of the LVM thin-pool is below `{$LVM_LV_META_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"} ` and `{$LVM_LV_META_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent.
* High: LVM thin-pool free meta data on {HOST.NAME}:[{#LVM_LV_FULL_NAME} is very low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free,thin-pool].last()} < {$LVM_LV_META_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"} 

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},metadata_free_percent,thin-pool].last()} < {$LVM_LV_META_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free meta data of the LVM thin-pool is below `{$LVM_LV_META_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"} ` and `{$LVM_LV_META_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent.
* Warning: LVM thin-pool free pool data on {HOST.NAME}:[{#LVM_LV_FULL_NAME} is low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free,thin-pool].last()} < {$LVM_LV_POOL_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"} 

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free_percent,thin-pool].last()} < {$LVM_LV_POOL_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free pool data of the LVM thin-pool is below `{$LVM_LV_POOL_DATA_FREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"} ` and `{$LVM_LV_POOL_DATA_PFREE_WARNING_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent.
* High: LVM thin-pool free pool data on {HOST.NAME}:[{#LVM_LV_FULL_NAME} is very low (< $2 %, {ITEM.VALUE1} free)
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free,thin-pool].last()} < {$LVM_LV_POOL_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"} 

and

{Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free_percent,thin-pool].last()} < {$LVM_LV_POOL_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}
  ```
  The free pool data of the LVM thin-pool is below `{$LVM_LV_POOL_DATA_FREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"} ` and `{$LVM_LV_POOL_DATA_PFREE_HIGH_THRESHOLD:"{#LVM_LV_FULL_NAME}"}` percent.
* High: LVM thin-pool LV {#LVM_LV_FULL_NAME} is not active ({ITEM.VALUE1}) on {HOSTNAME}
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thin-pool].str(active)}=0
  ```
  The thin-pool LVM logical volume is not in state "active", which is most likely a sign of a problem.
#### LVM logical thin snapshot volumes discovery (`rabe.lvm.lvs.discovery[thinsnapshot]`)
Low-Level discovery of a thin provisioned snapshot LVM logical volumes (LV)

Returns the following macros for each available LV:
* `{#LVM_LV_FULL_NAME}`
  * Logical volume full name (`lvs -o lv_full_name`)
  * Example: `vg_example_01/lv_example_01`
* `{#LVM_LV_UUID}`
  * Logical volume UUID (`lvs -o lv_uuid`)
  * Example. `dxi5Hw-Xo2m-SAVi-ypZh-QO4I-krpI-sR3N67`
* `{#LVM_LV_TYPE}`
  * Logical volume segment type (`lvs -o segtype`)
  * Example: `linear`, `thin`, `thin-pool`
* `{#LVM_LV_ROLE}`
  * Logical volume role (`lvs -o lv_role`)
  * Example: `public`, `private`, `public,snapshot,thicksnapshot`
* `{#LVM_LV_NAME}`
  * Logical volume name (`lvs -o lv_name`)
  * Example: `lv_example_01`
* `{#LVM_LV_VG_NAME}`
  * Volume group name (`lvs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_LV_PATH}`
  * Full pathname for LV. Blank for internal LVs. (`lvs -o lv_path`)
  * Example: `/dev/vg_example_01/lv_example_01`
##### Item Prototypes
* Active state of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thinsnapshot]`)  
  Active state of a thin provisioned LVM snapshot.
* Size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_size,thinsnapshot]`)  
  The size of a thin provisioned LVM snapshot.
* Origin of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},origin,thinsnapshot]`)  
  Origin device of a thin provisioned LVM snapshot.
* Thin pool of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},pool_lv,thinsnapshot]`)  
  The thin pool LV name of a thin provisioned LVM snapshot.
#### LVM logical thin volumes discovery (`rabe.lvm.lvs.discovery[thin]`)
Low-Level discovery of thin LVM logical volumes (LV)

Returns the following macros for each available LV:
* `{#LVM_LV_FULL_NAME}`
  * Logical volume full name (`lvs -o lv_full_name`)
  * Example: `vg_example_01/lv_example_01`
* `{#LVM_LV_UUID}`
  * Logical volume UUID (`lvs -o lv_uuid`)
  * Example. `dxi5Hw-Xo2m-SAVi-ypZh-QO4I-krpI-sR3N67`
* `{#LVM_LV_TYPE}`
  * Logical volume segment type (`lvs -o segtype`)
  * Example: `linear`, `thin`, `thin-pool`
* `{#LVM_LV_ROLE}`
  * Logical volume role (`lvs -o lv_role`)
  * Example: `public`, `private`, `public,snapshot,thicksnapshot`
* `{#LVM_LV_NAME}`
  * Logical volume name (`lvs -o lv_name`)
  * Example: `lv_example_01`
* `{#LVM_LV_VG_NAME}`
  * Volume group name (`lvs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_LV_PATH}`
  * Full pathname for LV. Blank for internal LVs. (`lvs -o lv_path`)
  * Example: `/dev/vg_example_01/lv_example_01`
##### Item Prototypes
* Free data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free,thin]`)  
  The free data of a thin provisioned LVM logical volume (LV) in bytes.
* Free data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_free_percent,thin]`)  
  The percentage of free data of a thin provisioned LVM logical volume (LV).
* Allocated data of $3 LV $1 in % (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_percent,thin]`)  
  The percentage of allocated data of a thin provisioned LVM logical volume (LV).
* Allocated data of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},data_used,thin]`)  
  The allocated data of a thin provisioned LVM logical volume (LV) in bytes.
* Active state of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thin]`)  
  Active state of a thin provisioned LVM logical volume (LV).
* Size of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_size,thin]`)  
  The size of a thin provisioned LVM logical volume (LV).
* Thin pool of $3 LV $1 (`rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},pool_lv,thin]`)  
  The thin pool LV name of a thin provisioned LVM logical volume (LV).
##### Trigger Prototypes
* High: LVM thin LV {#LVM_LV_FULL_NAME} is not active ({ITEM.VALUE1}) on {HOSTNAME}
  ```
  {Template App LVM active:rabe.lvm.lvs.value[{#LVM_LV_FULL_NAME},lv_active,thin].str(active)}=0
  ```
  The thin provisioned LVM logical volume is not in state "active", which is most likely a sign of a problem.
#### LVM physical volumes discovery (`rabe.lvm.pvs.discovery`)
Low-Level discovery of LVM physical volumes (PV)

Returns the following macros for each available PV:
* `{#LVM_PV_NAME}`
  * Physical volume name (`pvs -o pv_name`)
  * Example: `/dev/sda`
* `{#LVM_PV_UUID}`
  * Physical volume UUID (`pvs -o pv_uuid`)
  * Example. `S1qfoV-Jbmw-qjqH-koz3-HEyh-eNme-eHlBe8`
* `{#LVM_PV_TYPE}`
  * Physical volume metadata type (`pvs -o pv_fmt`)
  * Example: `lvm2`
##### Item Prototypes
* Underlying device size of PV $1 (`rabe.lvm.pvs.value[{#LVM_PV_NAME},dev_size]`)  
  The size of the underlying device of an LVM physical volume (PV).
* Unallocated space on PV $1 (`rabe.lvm.pvs.value[{#LVM_PV_NAME},pv_free]`)  
  Unallocated (free) space on an LVM physical volume (PV).
* Size of PV $1 (`rabe.lvm.pvs.value[{#LVM_PV_NAME},pv_size]`)  
  The size of an LVM physical volume (PV).
* Allocated space on PV $1 (`rabe.lvm.pvs.value[{#LVM_PV_NAME},pv_used]`)  
  Allocated (used) space on an LVM physical volume (PV).
#### LVM volume groups discovery (`rabe.lvm.vgs.discovery`)
Low-Level discovery of LVM volume groups (VG)

Returns the following macros for each available PV:
* `{#LVM_VG_NAME}`
  * Volume group name (`vgs -o vg_name`)
  * Example: `vg_example_01`
* `{#LVM_VG_UUID}`
  * Volume group name (`vgs -o vg_uuid`)
  * Example. `s83QZR-w6c4-Ngqk-u1fM-STAl-evYq-MLxiN0`
* `{#LVM_VG_TYPE}`
  * Volume group metadata type (`vgs -o vg_fmt`)
  * Example: `lvm2`
##### Item Prototypes
* Number of LVs on VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},lv_count]`)  
  Number of logical volumes (LVs) on an LVM volume group (VG).
* Number of PVs on VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},pv_count]`)  
  Number of physical volumes (PVs) belonging to an LVM volume group (VG).
* Number of Snapshots on VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},snap_count]`)  
  Number of snapshots on an LVM volume group (VG).
* Free space on VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},vg_free]`)  
  Amount of free space of an LVM volume group (VG).
* Number of missing PVs in VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},vg_missing_pv_count]`)  
  Number of missing physical volumes (PVs) on an LVM volume group (VG).
* Size of VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},vg_size]`)  
  The size of an LVM volume group (VG).
* Used space on VG $1 (`rabe.lvm.vgs.value[{#LVM_VG_NAME},vg_used]`)  
  Amount of used space of an LVM volume group (VG).
##### Trigger Prototypes
* High: {ITEM.VALUE1} LVM PVs missing on {HOST.NAME}:[{#LVM_VG_NAME}
  ```
  {Template App LVM active:rabe.lvm.vgs.value[{#LVM_VG_NAME},vg_missing_pv_count].last()}>0
  ```
  The LVM volume group misses one ore more physical volumes.
## SELinux Policy

The [rabezbxlvm](selinux/rabezbxlvm.te) policy allows the zabbix agent to
execute `sudo` and the various LVM commands.
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

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
