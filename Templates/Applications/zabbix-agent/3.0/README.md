# Zabbix zabbix-agent monitoring
Basic Zabbix Agent operations.

Based on the [official Zabbix agent template from Zabbix distribution](https://share.zabbix.com/official-templates/applications/zabbix-agent) but made active.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_Zabbix_Agent_active.xml`](Template_App_Zabbix_Agent_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App Zabbix Agent active
This template is part of RaBe's Zabbix template and helpers collection at https://github.com/radiorabe/rabe-zabbix.
### Items
* Host name of zabbix_agentd running (`agent.hostname`)  
* Agent ping (`agent.ping`)  
  The agent always returns 1 for this item. It could be used in combination with nodata() for availability check.
* Version of zabbix_agent(d) running (`agent.version`)  
### Macros
* `{$APP_ZABBIX_AGENT_NODATA_HIGH_TIME}` (default: 5m)
### Triggers
* Information: Host name of zabbix_agentd was changed on {HOST.NAME}
  ```
  {Template App Zabbix Agent active:agent.hostname.diff(0)}>0
  ```
* High: No current data from Zabbix agent on {HOST.NAME}
  ```
  {Template App Zabbix Agent active:agent.ping.nodata({$APP_ZABBIX_AGENT_NODATA_HIGH_TIME})}=1
  ```
* Information: Version of zabbix_agent(d) was changed on {HOST.NAME}
  ```
  {Template App Zabbix Agent active:agent.version.diff(0)}>0
  ```
## SELinux Policy

The [rabezbxzabbixagent](selinux/rabezbxzabbixagent.te) policy allows the agent to set its rlimit
as described by [ZBX-10086](https://support.zabbix.com/browse/ZBX-10086).

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
