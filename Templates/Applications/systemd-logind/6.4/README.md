# Zabbix Template: systemd-logind

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: systemd-logind](https://img.shields.io/badge/target-systemd-logind-00c9bf)

Monitoring of [systemd-logind](https://www.freedesktop.org/software/systemd/man/latest/systemd-logind.service.html).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: systemd-logind: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about systemd-logind processes

```
proc.get[systemd-logind,root,,summary]
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: systemd-logind: CPU seconds (system)

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Total CPU seconds (system) of systemd-logind processes.

```
rabe.systemd-logind.cputime_system
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-logind: CPU seconds (user)

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Total CPU seconds (user) of systemd-logind processes.

```
rabe.systemd-logind.cputime_user
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-logind: Number of processes

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Number of systemd-logind processes.

```
rabe.systemd-logind.processes
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-logind: Memory usage (RSS)

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Memory usage of systemd-logind processes.

```
rabe.systemd-logind.rss
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-logind: Swap usage

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Swap usage of systemd-logind processes.

```
rabe.systemd-logind.swap
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: systemd-logind: Number of threads

![component: systemd-logind](https://img.shields.io/badge/component-systemd-logind-00c9bf)

Number of systemd-logind threads.

```
rabe.systemd-logind.threads
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[systemd-logind,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: systemd-logind: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running systemd-logind processes.

Priority: HIGH

```
last(/systemd-logind/rabe.systemd-logind.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* systemd-logind: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
