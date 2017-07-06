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
* Create at least one unique application per app and snmp template
* Use macros whenever possible and feasible, prefix them with a unique per template prefix

### App specific conventions

* Apps may contain configuration snippets in a `userparameters/` subdir.
* SELinux policy modules for an app are in the `selinux/` subdir. They are prefixed with "rabezbx" to help differentiate them from system policy.

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

mv zbx_export_templates.xml "${appDir}/${xmlName}"
```

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
