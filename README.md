# rabe-zabbix
Collection of various [Zabbix](http://www.zabbix.com/) templates and helper scripts created or used by [Radio Bern RaBe](http://rabe.ch/).

## Zabbix Templates
The Zabbix templates are located within the [templates](templates) subfolder and are further subdived into the following categories:
* [Operating system (os)](templates/os): All operating system specific templates
  * Naming convention: <code>Template_OS_\<OPERATING-SYSTEM-NAME\>_active</code>
  * Example: <code>Template_OS_Linux_active</code>
* [Application (app)](templates/app): All application specifc templates
  * Naming convention: <code>Template_App_\[\<OPERATING-SYSTEM-NAME\]_\<APPLICATION-NAME\>_active</code>
  * Example: <code>Template_App_Linux_Postfix_active</code>
* [SNMP (snmp)](templates/snmp): All SNMP based templates
  * Naming convention: <code>Template_SNMP\<SNMP-VERSION\>_\<NAME\></code>
  * Example: <code>Template_SNMPv2_Interfaces_HC</code>
* [Stack (stack)](templates/stack): Stack templates define a single system (or role) and might inherit further stack templates, or exactly one operating system template as well as multiple application or SNMP templates.
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
