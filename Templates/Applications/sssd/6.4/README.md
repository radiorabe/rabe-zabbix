# Zabbix Template: sssd

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: sssd](https://img.shields.io/badge/target-sssd-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [sssd](https://sssd.io).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SSSD.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Items

### Item: sssd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about sssd processes

```
proc.get[sssd,root,,summary]
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: sssd: CPU seconds (system)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Total CPU seconds (system) of sssd processes.

```
rabe.sssd.cputime_system
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: CPU seconds (user)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Total CPU seconds (user) of sssd processes.

```
rabe.sssd.cputime_user
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Number of processes

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Number of sssd processes.

```
rabe.sssd.processes
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Memory usage (RSS)

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Memory usage of sssd processes.

```
rabe.sssd.rss
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Swap usage

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Swap usage of sssd processes.

```
rabe.sssd.swap
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: sssd: Number of threads

![component: sssd](https://img.shields.io/badge/component-sssd-00c9bf)

Number of sssd threads.

```
rabe.sssd.threads
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[sssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: sssd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running sssd processes.
Settings:
| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/sssd/rabe.sssd.processes)<{$SSSD.THRESHOLD.MIN_PROC}
```

## Dashboards

The following Zabbix dashboards are included in this template.
* sssd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
