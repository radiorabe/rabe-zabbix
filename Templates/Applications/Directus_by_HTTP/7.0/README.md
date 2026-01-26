# Zabbix Template: Directus by HTTP

![target: directus](https://img.shields.io/badge/target-directus-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 7.0](https://img.shields.io/badge/version-7.0-00c9bf)

Monitoring of [Directus](https://directus.io/).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Items

### Item: Directus: Server Status

![component: server](https://img.shields.io/badge/component-server-00c9bf)

Server health.

```console
directus.server.status
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `directus._get.server.status` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| JSONPATH | `["$.status"]` |
| JAVASCRIPT | `["if (value == \"warn\") {\n  return 1;\n} else if (value == \"error\") {\n  return 2;\n}\nreturn 0;\n"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["5m"]` |

### Item: Directus: Get Status Page

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)

Path to scrape from Directus, usually something like https://directus.example.org/server/health.

```console
directus._get.server.status
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | HTTP_AGENT |
| Value type | TEXT |

## Triggers

### Trigger: Directus: Error status

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

Directus is reporting an error status for the Directus server.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | HIGH |

```console
last(/Directus by HTTP/directus.server.status)=2
```

### Trigger: Directus: Warning status

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

Directus is reporting a warning status for the Directus server.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |

```console
last(/Directus by HTTP/directus.server.status,#1)=1 and last(/Directus by HTTP/directus.server.status,#2)=1
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$DIRECTUS.SERVER.STATUS}`



Default:

```console

```

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2026 [Radio Bern RaBe](http://www.rabe.ch)
