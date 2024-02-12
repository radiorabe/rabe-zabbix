# Zabbix Template: Zabbix unsupported items

![class: app](https://img.shields.io/badge/class-app-00c9bf)![target: zabbix](https://img.shields.io/badge/target-zabbix-00c9bf)

Implementation agnostic monitoring of unsupported items from Zabbix internal.

Used as a mix-in to most low-level stack templates.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: Unsupported items

![component: zabbix](https://img.shields.io/badge/component-zabbix-00c9bf)![target: zabbix](https://img.shields.io/badge/target-zabbix-00c9bf)

The number of unsupported items on this host

Type: INTERNAL

```
zabbix[host,,items_unsupported]
```

## Triggers

## Trigger: Unsupported items detected

![scope: notice](https://img.shields.io/badge/scope-notice-00c9bf)

The host has unsupported items, which might be an indication of a problem with certain items. Disable or fix the items.

A count expression is used to reduce flapping to allow for items to go missing for one reading and then show back up.


Priority: WARNING

```
count(/Zabbix unsupported items/zabbix[host,,items_unsupported],#3,"gt","0")>=1
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
