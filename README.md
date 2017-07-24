# rabe-zabbix
Collection of various [Zabbix](http://www.zabbix.com/) templates and helper scripts created or used by [Radio Bern RaBe](http://rabe.ch/).

## Zabbix Templates
The Zabbix templates are located within the [templates](templates) subfolder and are further subdived into the following categories:
* [Operating system (os)](os): All operating system specific templates
  * Naming convention: <code>Template_OS_\<OPERATING-SYSTEM-NAME\>_active</code>
  * Example: <code>Template_OS_Linux_active</code>
* [Application (app)](app): All application specifc templates
  * Naming convention: <code>Template_App_\[\<OPERATING-SYSTEM-NAME\]_\<APPLICATION-NAME\>_active</code>
  * Example: <code>Template_App_Linux_Postfix_active</code>
* [IPMI (ipmi)](ipmi): All IPMI based templates
  * Naming convention: <code>Template_IPMI_\<NAME\></code>
  * Example: <code>Template_IPMI_Threshold_Sensors</code>
* [SNMP (snmp)](snmp): All SNMP based templates
  * Naming convention: <code>Template_SNMP\<SNMP-VERSION\>_\<NAME\></code>
  * Example: <code>Template_SNMPv2_Interfaces_HC</code>
* [Stack (stack)](stack): Stack templates define a single system (or role) and might inherit further stack templates, or exactly one operating system template as well as multiple application or SNMP templates.
 * Naming convention: <code>Template_Stack_\<STACK-NAME\>_active</code>
 * Example: <code>Template_Stack_MediaWiki_active</code>

### Stack templates explained
Every host within Zabbix gets a specifc stack template assigned according to its role. The stack exactly defines the setup of this host and will be re-used if there is more than one host with the same role.
 
As an example, a host which servers a MediaWiki instance, will get the stack template <code>Template_Stack_MediaWiki_active</code> assigned. The stack template might include the operating system template <code>Template_OS_Linux_active</code>, the application templates <code>Template_App_Linux_Apache_HTTPD_active</code>, <code>Template_App_Linux_PHP-FPM_active</code> and <code>Template_App_Linux_MariaDB_active</code>.
 
This ensures great modularity, reusability and avoids unecessary inheritance problems.
 
### Further template conventions
* Use active mode for zabbix agent items by default
* Use an update interval of 300 seconds (5 minutes) by default
* Create at least one unique application per app, ipmi and snmp template
* Use macros whenever possible and feasible, prefix them with a unique per template prefix

### App specific conventions

* Apps may contain configuration snippets in a `userparameters/` subdir.
* SELinux policy modules for an app are in the `selinux/` subdir. They are prefixed with "rabezbx" to help differentiate them from system policy.

### IPMI specific conventions
* Name server or motherboard templates according to `IPMI <VENDOR>
  <PRODUCT-NAME>`, for example `Template IPMI Supermicro SSG-6048R-E1CR24N`
* Try to build up a server or motherboard template from existing (or newly
  created) standalone sensor templates (which can be reused for the same sensor
  and reading type).
* Standalone sensor templates which contain sensor-specific discrete IPMI
  sensors (event/reading type code 6Fh)
   * Template naming according to `IPMI <SENSOR-NAME> Sensors`, for example
     `IPMI Power Supply Sensors`
   * Item key naming according to
     `ipmi.discrete-sensor[<SENSOR-TYPE>,<SENSOR-NAME>]`, for example
     `ipmi.discrete-sensor[power-supply,{#IPMI_SENSOR_NAME}]`
   * Create triggers according to the sensor's specific event/reading type code
     and offsets (see [Table 42-3, Sensor Type
     Codes](http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/second-gen-interface-spec-v2.pdf))
     with the help of the Zabbix [band()
     function](https://www.zabbix.com/documentation/3.0/manual/appendix/triggers/functions)
* Standalone sensor templates which contain generic discrete IPMI sensors
  (event/reading type code 02h - 0Ch)
   * Template naming according to `IPMI <SENSOR-NAME> Generic Sensors`, for
     example `IPMI Module Board Generic Sensors`
   * Item key naming according to
     `ipmi.discrete-generic-sensor[<SENSOR-TYPE>,<SENSOR-NAME>]`, for example
     `ipmi.discrete-generic-sensor[module-board,{#IPMI_SENSOR_NAME}]`
   * Create triggers according to the sensor's generic event/reading type code
     and offsets (see [Table 42-2, Generic Event/Reading Type
     Codes](http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/second-gen-interface-spec-v2.pdf))
     with the help of the Zabbix [band()
     function](https://www.zabbix.com/documentation/3.0/manual/appendix/triggers/functions)
* Use the provided `ipmi-sensor-discovery.sh` external check script for
  low-level auto-discovery of multiple sensors.
* FreeIPMI's [interpret sensor
  configuration](http://git.savannah.gnu.org/cgit/freeipmi.git/tree/etc/freeipmi_interpret_sensor.conf)
  might be helpful for mapping sensor states to Zabbix trigger severities.
* There should be no more need for threshold based sensor templates
  (event/reading type code 01h), as they are already handled by the `IPMI
  Threshold Sensors` template.

## Developing

### Adding an app template

```bash
appName="" # app name

lowercaseName="${appName,,}"
shortName="${lowercaseName//-/}"

templateName="Template App ${appName} active"
xmlName="${templateName// /_}.xml"

appDir="app/${appName// /_}"

mkdir -p "${appDir}/doc"
touch "${appDir}/doc/README.head.md"

# see fetching below if you want help exporting
mv zbx_export_templates.xml "${appDir}/${xmlName}"
```

#### Fetching an app from the Zabbix server
Fetching a template into a file from the server is straightforward.

```bash
./helper/rabe-zabbix --template=${templateName} ${xmlName}
```

You need to have a working node environment and install any dependencies beforehand.

```bash
npm install
```

The helper will prompt for settings should they not be configured. Please see its `--help` for more information.

#### optional selinux policy
```bash
$avcViolation="" # multiple lines from /var/log/audit/audit.log

moduleName="rabezbx${shortName// /}"

mkdir "${appDir}/selinux"

echo ${avcViolation} | audit2allow -m ${moduleName} > \
  "${appDir}/selinux/${moduleName}.te"

cat > "${appDir}/doc/README.SELinux.md" <<EOD
## SELinux Policy

The [${moduleName}](selinux/${moduleName}.te) policy does <dox>.
EOD
```

#### optional userparameters
```bash
mkdir "${appDir}/userparameters"

userParameterName="rabe.${lowercaseName// /-}"

cat > "${appDir}/userparameters/${userParameterName}.conf" <<EOD
#
# dox here
#
UserParameter=${userParameterName}.<key>,<script>
EOD

cat > "${appDir}/doc/README.UserParameters.md" <<EOD
## UserParameters

| Key | Description |
| --- | ----------- |
| \`${userParameterName}.<key>\` | <dox> |
EOD
```

#### optional scripts
```bash
mkdir "${appDir}/scripts"

scriptName="rabe-${lowercaseName// /-}.sh"

touch "${appDir}/scripts/${scriptName}"

cat > "${appDir}/doc/README.scripts.md" <<EOD
## Scripts

* [${scriptName}](./scripts/${scriptName}) for ${userParameterName}.<key> UserParameter

<dox below listing if needed>
EOD
```

### Adding an IPMI template

```bash
ipmiName="" # IPMI sensor, board or server name

lowercaseName="${ipmiName,,}"

templateName="Template IPMI ${ipmiName}"
xmlName="${templateName// /_}.xml"

ipmiDir="ipmi/${ipmiName// /_}"

mkdir -p "${ipmiDir}/doc"
touch "${ipmiDir}/doc/README.head.md"

mv zbx_export_templates.xml "${ipmiDir}/${xmlName}"
```

#### optional scripts
```bash
scriptName="ipmi-${lowercaseName// /-}"

mkdir -p "${ipmiDir}/scripts"

touch "${ipmiDir}/scripts/${scriptName}.sh"

cat > "${ipmiDir}/doc/README.scripts.md" <<EOD
## Scripts

* [${scriptName}.sh](./scripts/${scriptName}.sh) <short description>

<dox below listing if needed>
EOD
```

## RPM Packages

The rabe-zabbix templates come with an RPM package that helps install SELinux policies and UserParameter configs. We provide a pre-built version
through the [openSUSE Build Server](https://build.opensuse.org/). They are available as part of the [home:radiorabe:zabbix Subproject](https://build.opensuse.org/project/show/home:radiorabe:zabbix). You can install them as follows.

```bash
curl -o /etc/yum.repos.d/home:radiorabe:zabbix.repo \
     http://download.opensuse.org/repositories/home:/radiorabe:/zabbix/CentOS_7/home:radiorabe:zabbix.repo

yum install rabe-zabbix
```

## Releasing

* Bump the version in the Specfile and add a new commit to master with the version bump
* Tag this commit with the same version you used in the Specfile
* Push master and the tag to github
* The openSUSE Build Service should get triggered and build a new package automagically

## License
This template collection is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
