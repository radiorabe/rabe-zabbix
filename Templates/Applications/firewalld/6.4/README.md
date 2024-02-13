# Zabbix Template: firewalld

![class: software](https://img.shields.io/badge/class-software-00c9bf)![target: firewalld](https://img.shields.io/badge/target-firewalld-00c9bf)![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf)![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Keeps track of [firewalld](https://firewalld.org/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix)


## Items

### Item: firewalld: process summary

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Get info about firewalld processes

```
proc.get[firewalld,root,,summary]
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | ZABBIX_ACTIVE |
| Value type | TEXT |

### Item: firewalld: CPU seconds (system)

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Total CPU seconds (system) of firewalld processes.

```
rabe.firewalld.cputime_system
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_system.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: firewalld: CPU seconds (user)

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Total CPU seconds (user) of firewalld processes.

```
rabe.firewalld.cputime_user
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | FLOAT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].cputime_user.first()"]` |
| SIMPLE_CHANGE | `[""]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: firewalld: Number of processes

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Number of firewalld processes.

```
rabe.firewalld.processes
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].processes.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: firewalld: Memory usage (RSS)

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Memory usage of firewalld processes.

```
rabe.firewalld.rss
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].rss.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: firewalld: Swap usage

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Swap usage of firewalld processes.

```
rabe.firewalld.swap
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].swap.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: firewalld: Number of threads

![component: firewalld](https://img.shields.io/badge/component-firewalld-00c9bf)

Number of firewalld threads.

```
rabe.firewalld.threads
```

Settings:
| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `proc.get[firewalld,root,,summary]` |

Preprocessing steps:
| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$[*].threads.first()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

## Triggers

## Trigger: firewalld: No running processes

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No running firewalld processes.
Settings:
| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```
last(/firewalld/rabe.firewalld.processes)<1
```

## Dashboards

The following Zabbix dashboards are included in this template.
* firewalld: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2024 [Radio Bern RaBe](http://www.rabe.ch)
