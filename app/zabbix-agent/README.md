# zabbix-agent

Basic Zabbix Agent operations.

* [Template App Zabbix Agent active](Template_App_Zabbix_Agent_active.xml)
* [SELinux policy module rabezbxzabbixagent](selinux/rabezbxzabbixagent.te)

## Template
Based on the [official Zabbix agent template from Zabbix distribution](https://share.zabbix.com/official-templates/applications/zabbix-agent) but made active.

### Items

* Host name of zabbix_agentd running (agent.hostname)
* Agent ping (agent.ping)
* Version of zabbix_agent(d) running (agent.version)

### Triggers

* High: No current data from Zabbix agent on {HOST.NAME}
* Information: Host name of zabbix_agentd was changed on {HOST.NAME}
* Information: Version of zabbix_agent(d) was changed on {HOST.NAME}

### Macros

* `{$APP_ZABBIX_AGENT_NODATA_HIGH_TIME}`

  Time for which no current data must be available for HIGH trigger (5m per default)

## SELinux Policy

The [rabezbxzabbixagent](selinux/rabezbxzabbixagent.te) policy allows the agent to set its rlimit
as described by [ZBX-10086](https://support.zabbix.com/browse/ZBX-10086).

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
