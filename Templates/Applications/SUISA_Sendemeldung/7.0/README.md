# Zabbix Template: SUISA Sendemeldung

![target: suisa_sendemeldung](https://img.shields.io/badge/target-suisa_sendemeldung-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Monitoring for [SUISA Sendmeldung](https://radiorabe.github.io/suisa_sendemeldung/).

Contains a trapper item for monitoring sucessful runs based on their
last timestamp as a well as a trigger that alerts us when the last
run is more than a month old.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: Last Sucessful Run

![component: service](https://img.shields.io/badge/component-service-00c9bf)



```console
rabe.suisa_sendemeldung.run.success
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | TRAP |
| History | 90d |

## Triggers

### Trigger: Last run expired

![scope: compliance](https://img.shields.io/badge/scope-compliance-00c9bf)


Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |

```console
(now() - last(/SUISA Sendemeldung/rabe.suisa_sendemeldung.run.success)) > 2592000
```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2026 [Radio Bern RaBe](http://www.rabe.ch)
