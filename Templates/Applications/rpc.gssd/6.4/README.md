# Zabbix Template: rpc.gssd

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: rpc.gssd](https://img.shields.io/badge/target-rpc.gssd-00c9bf)

Monitoring of [rpc.gssd](https://linux.die.net/man/8/rpc.gssd).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).


## Items

### Item: rpc.gssd: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about rpc.gssd processes

```
proc.get[rpc.gssd,root,,summary]
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: rpc.gssd: CPU seconds (system)

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Total CPU seconds (system) of rpc.gssd processes.

```
rabe.rpc.gssd.cputime_system
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rpc.gssd: CPU seconds (user)

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Total CPU seconds (user) of rpc.gssd processes.

```
rabe.rpc.gssd.cputime_user
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rpc.gssd: Number of processes

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Number of rpc.gssd processes.

```
rabe.rpc.gssd.processes
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rpc.gssd: Memory usage (RSS)

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Memory usage of rpc.gssd processes.

```
rabe.rpc.gssd.rss
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rpc.gssd: Swap usage

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Swap usage of rpc.gssd processes.

```
rabe.rpc.gssd.swap
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: rpc.gssd: Number of threads

![component: rpc.gssd](https://img.shields.io/badge/component-rpc.gssd-00c9bf)

Number of rpc.gssd threads.

```
rabe.rpc.gssd.threads
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[rpc.gssd,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: rpc.gssd: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running rpc.gssd processes.

Priority: HIGH

```
last(/rpc.gssd/rabe.rpc.gssd.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* rpc.gssd: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
