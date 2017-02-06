# chrony

Basic chrony NTP client monitoring.

* [Template App chrony active](Template_App_chrony_active.xml)

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Template

### Items

* Memory usage (rss) of "chronyd" processes (proc.mem[chronyd,chrony,,,rss])
* Number of "chronyd" processes (proc.num[chronyd,chrony])

### Triggers

* High: No running chronyd processes on {HOST.NAME}

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
