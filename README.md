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

### SNMP specific conventions
* Name SNMP templates according to `Template SNMPv<SNMP-VERSION> <NAME>`, for example
  `Template SNMPv2 Bridge`
* Try to reflect the MIBs name within `<NAME>` whenever feasible
* Use the textual form of MIB OIDs within your SNMP items.
  As an example, use `BRIDGE-MIB::dot1dBaseNumPorts.0` instead of
  `.1.3.6.1.2.1.17.1.2.0`
* Include instructions on how to obtain and install the required MIBs for your
  template.
* Name items according to `rabe.snmp.<NAME>.<OID-NAME>` to avoid clashes with
  other templates.
  Example: `rabe.snmp.bridge.dot1dBaseNumPorts`
* Name low-level discovery rule keys with `rabe.snmp.<NAME>.<OBJECT>.discovery`
  Example: `rabe.snmp-bridge.ports.discovery`
* Create value mappings according to the OID's syntax definition from the MIB.

## Developing

### Adding an app template

```bash
appName="" # app name
appURL=""  # URL to the upstream project/software

lowercaseName="${appName,,}"
uppercaseName="${appName^^}"

shortName="${lowercaseName//-/}"

templateName="Template App ${appName} active"
xmlName="${templateName// /_}.xml"

appDir="app/${appName// /_}"

gitBranchName="feature/app-${lowercaseName// /-}"


git checkout -b "${gitBranchName}"
mkdir -p "${appDir}/doc"

# Generate a minimal documentation
cat > "${appDir}/doc/README.head.md" << EOF
Monitoring of [${appName}]($appURL).

## Usage
1. Import the
   [\`${xmlName}\`](${xmlName})
   into your Zabbix server (click on the \`Raw\` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives
EOF

# Extend the documentation as necessary
vi "${appDir}/doc/README.head.md"

# Commit the documentation
git add "${appDir}/doc/README.head.md"
git commit -m "${appName}: Added documentation"


# Export the Zabbix template and move it to the final destination
# see fetching below if you want help exporting
mv zbx_export_templates.xml "${appDir}/${xmlName}"

# Commit the Zabbix template
git add "${appDir}/${xmlName}"
git commit -m "${appName}: Added ${templateName}"
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


# Commit the SELinux policy and documentation
git add "${appDir}/selinux/${moduleName}.te"
git add "${appDir}/doc/README.SELinux.md"
git commit -e -m "${appName}: Added SELinux module and documentation"
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


# Commit the userparameters and documentation
git add "${appDir}/userparameters/${userParameterName}.conf"
git add "${appDir}/doc/README.UserParameters.md"
git commit -e -m "${appName}: Added user parameters and docs."
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

# Commit the scripts and documentation
git add "${appDir}/scripts/*"
git add "${appDir}/doc/README.scripts.md"
git commit -e -m "${appName}: Added scripts and docs."
```

#### optional Sudo security policies
```bash
mkdir "${appDir}/sudoers.d"

sudoersFileName="rabezbx-${lowercaseName// /_}"
sudoersCmndAliasPrefix="RABEZBX_${uppercaseName//[ -]/_}"

cat > "${appDir}/sudoers.d/${sudoersFileName}" << EOF
##
## Defaults specification for the zabbix user
##
Defaults:zabbix !requiretty

##
## Command alias specifications for ${appName}
##
Cmnd_Alias ${sudoersCmndAliasPrefix}_MYCMD = /sbin/mycmd -a -b -c
Cmnd_Alias ${sudoersCmndAliasPrefix}_MYOTHERCMD = /sbin/myothercmd

##
## User privilege specifications for the zabbix user
##
zabbix ALL=NOPASSWD: ${sudoersCmndAliasPrefix}_MYCMD
zabbix ALL=NOPASSWD: ${sudoersCmndAliasPrefix}_MYOTHERCMD
EOF


# Commit the sudo configuration snippet
git add "${appDir}/sudoers.d/${sudoersFileName}"
git commit -e -m "${appName}: Added sudoers config."
```

Adapt the `MYCMD` and `MYOTHERMCD` command aliases accordingly.

#### Generate the template documentation and push
As a final step you have to generate the template configuration and push to
GitHub afterwards.
```bash
# Generate the template documentation
make update-app-doc
git add "${appDir}/README.md"
git commit -m "${appName}: Added generated documentation"

# Push and create a PR on GitHub afterwards
git push --set-upstream origin "${gitBranchName}"
```

### Adding an OS template

```bash
osName="" # Operating system name

lowercaseName="${osName,,}"
gitBranchName="feature/os-${lowercaseName// /-}"

git checkout -b "${gitBranchName}"

templateName="Template OS ${osName}"
xmlName="${templateName// /_}.xml"

osDir="os/${osName// /_}"


mkdir -p "${osDir}/doc"
touch "${osDir}/doc/README.head.md"

# Write the documentation for your template
vi "${osDir}/doc/README.head.md"

git add "${osDir}/doc/README.head.md"
git commit -m "${osName}: Added documentation"


# Export the Zabbix template and move it to the final destination
mv zbx_export_templates.xml "${osDir}/${xmlName}"

git add "${osDir}/${xmlName}"
git commit -m "${osName}: Added ${templateName}"


# Generate the template documentation
make update-os-doc
git add "${osDir}/README.md"
git commit -m "${osName}: Added generated documentation"


# Push and create a PR on GitHub afterwards
git push --set-upstream origin "${gitBranchName}"
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

### Adding an SNMP template

```bash
snmpName=""     # Name, usually related to the MIB
snmpVersion="2" # SNMP version, 2 or 3.

templateName="Template SNMPv${snmpVersion} ${snmpName}"
xmlName="${templateName// /_}.xml"

snmpDir="snmp/SNMPv${snmpVersion}_${snmpName// /_}"

mkdir -p "${snmpDir}/doc"
touch "${snmpDir}/doc/README.head.md"

# Download you template from the zabbix server

mv zbx_export_templates.xml "${snmpDir}/${xmlName}"

```
Note, that you can also use the provided [template fetching
helper](#fetching-an-app-from-the-zabbix-server) script for downloading the
template from your Zabbix server.

## Debugging

The following commands might be helpful for general debugging:
* Test a specific Zabbix agent item  
  `su -c 'zabbix_agentd -t <ITEM-KEY>' -s /bin/bash zabbix`
* Restart the Zabbix agent  
  `systemctl restart zabbix-agent`
* Restart the Zabbix server  
  `systemctl restart zabbix-server`

The following logs might contain helpful hints:
* Zabbix Agent related messages  
  `/var/log/zabbix/zabbix_agentd.log`
* Zabbix Server related messages  
  `/var/log/zabbix/zabbix_server.log`
* sudo related messages  
  `journalctl -r /usr/bin/sudo`
* SELinux related messages  
  `/var/log/audit/audit.log`

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
