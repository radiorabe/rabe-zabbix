# Zabbix Template: certmonger

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: certmonger](https://img.shields.io/badge/target-certmonger-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Monitoring of [certmonger](https://www.freeipa.org/page/Certmonger).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$CERTMONGER.THRESHOLD.MIN_PROC}`

Minimum amount of processes expected to be running at all times.

Default:
```
1
```

## Items

### Item: certmonger: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about certmonger processes

```
proc.get[certmonger,root,,summary]
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: certmonger: CPU seconds (system)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (system) of certmonger processes.

```
rabe.certmonger.cputime_system
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: CPU seconds (user)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Total CPU seconds (user) of certmonger processes.

```
rabe.certmonger.cputime_user
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Number of processes

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger processes.

```
rabe.certmonger.processes
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Memory usage (RSS)

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Memory usage of certmonger processes.

```
rabe.certmonger.rss
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Swap usage

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Swap usage of certmonger processes.

```
rabe.certmonger.swap
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: certmonger: Number of threads

![component: certmonger](https://img.shields.io/badge/component-certmonger-00c9bf)

Number of certmonger threads.

```
rabe.certmonger.threads
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[certmonger,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: certmonger: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running certmonger processes.
Settings:
| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/certmonger/rabe.certmonger.processes)<{$CERTMONGER.THRESHOLD.MIN_PROC}
```

## Dashboards

The following Zabbix dashboards are included in this template.
* certmonger: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
