# Contributing to RaBe Zabbix

🚧 Refactor underway! Most of the instructions here are for 3.0 templates! 🚧

## Conventions

### Template conventions

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

The "RaBe Zabbix Templator" is based on Ansible and it's code is stored in the
`hack/` directory.
The playbook supports the version of Zabbix currently used at RaBe as we use
it to download templates for integration in this repository. The all-in-one
`manage.py` playbook takes care of everything, without an API key for the
RaBe servers it soley regenerates README files and documentation.

### Regenerating READMEs

```bash
ansible-playbook hack/plays/manage.yml
```

### Fetching Templates using ansible

```bash
ansible-playbook hack/plays/manage.yml -e ansible_zabbix_auth_key=<AUTH_KEY>
```

If you just want to fetch a single template:

```bash
ansible-playbook hack/plays/manage.yml -e ansible_zabbix_auth_key=<AUTH_KEY> -e 'rabe_zabbix_templates=[{"template_name":"CHANGEME"}]'
```

### Adding new templates

After downloading a template for the first time, you need to configure it's vendor in the new YAML file.

Add the following in `<Template_Group>/<Name>/<Version>/<Name>.yaml` right after the `description` key.

```yaml
      vendor:
        name: RaBe
        version: '6.4'
```

Switch branch and look at the generated README.md before you commit it:

```bash
git branch -c feat/<Template_Group>/add-<Name>-for-<Version>
git add <Template_Group>/<Name>/<Version>/
git commit -m 'feat: Add <Name> template'
```

## Release Management

The CI/CD setup uses semantic commit messages following the [conventional commits standard](https://www.conventionalcommits.org/en/v1.0.0/).
The workflow is based on the [RaBe shared actions](https://radiorabe.github.io/actions/)
and uses [go-semantic-commit](https://go-semantic-release.xyz/)
to create new releases.

The commit message should be structured as follows:

```console
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:

1. **fix:** a commit of the type `fix` patches gets released with a PATCH version bump
1. **feat:** a commit of the type `feat` gets released as a MINOR version bump
1. **BREAKING CHANGE:** a commit that has a footer `BREAKING CHANGE:` gets released as a MAJOR version bump
1. types other than `fix:` and `feat:` are allowed and don't trigger a release

If a commit does not contain a conventional commit style message you can fix
it during the squash and merge operation on the PR.

## Build Process

The CI/CD setup uses [mkdocs](https://www.mkdocs.org/) to publish documentation to [GitHub Pages](https://pages.github.com/).
The workflow is based on the [RaBe shared actions](https://radiorabe.github.io/actions/).
