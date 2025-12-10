# Zabbix Template: Songticker

![class: software](https://img.shields.io/badge/class-software-00c9bf) ![target: songticker](https://img.shields.io/badge/target-songticker-00c9bf) ![vendor: RaBe](https://img.shields.io/badge/vendor-RaBe-00c9bf) ![version: 6.4](https://img.shields.io/badge/version-6.4-00c9bf)

Check if the songticker is getting regular updates

## Items

### Item: Songticker: Last update

![component: songticker](https://img.shields.io/badge/component-songticker-00c9bf)



```console
rabe.songticker.date
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `rabe.songticker.xml` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| XMLPATH | `["/*[name()='ticker']/*[name()='date']/text()"]` |
| JAVASCRIPT | `["return Date.parse(value)/1000"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: Songticker: Show end

![component: songticker](https://img.shields.io/badge/component-songticker-00c9bf)

When the current show ends.

```console
rabe.songticker.show_endtime
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| History | 7d |
| Source item | `rabe.songticker.xml` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| XMLPATH | `["/*[name()='ticker']/*[name()='show']/*[name()='endTime']/text()"]` |
| JAVASCRIPT | `["return Date.parse(value)/1000"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: Songticker: Show name

![component: songticker](https://img.shields.io/badge/component-songticker-00c9bf)

Name of the currently running show.

```console
rabe.songticker.show_name
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `rabe.songticker.xml` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| XMLPATH | `["/*[name()='ticker']/*[name()='show']/*[name()='name']/text()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: Songticker: Current Artist

![component: songticker](https://img.shields.io/badge/component-songticker-00c9bf)

Currently running artist.

```console
rabe.songticker.track_artist
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `rabe.songticker.xml` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| XMLPATH | `["/*[name()='ticker']/*[name()='track']/*[name()='artist']/text()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: Songticker: Current Title

![component: songticker](https://img.shields.io/badge/component-songticker-00c9bf)

Currently running track.

```console
rabe.songticker.track_title
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | DEPENDENT |
| Value type | TEXT |
| History | 7d |
| Source item | `rabe.songticker.xml` |

Preprocessing steps:

| Type | Parameters |
| ---- | ---------- |
| XMLPATH | `["/*[name()='ticker']/*[name()='track']/*[name()='title']/text()"]` |
| DISCARD_UNCHANGED_HEARTBEAT | `["30m"]` |

### Item: Songticker XML reponse

![component: raw](https://img.shields.io/badge/component-raw-00c9bf)



```console
rabe.songticker.xml
```

Settings:

| Item Setting | Value |
| ------------ | ----- |
| Type | HTTP_AGENT |
| Value type | TEXT |

## Triggers

### Trigger: Songticker: Show ends in the past

![scope: availability](https://img.shields.io/badge/scope-availability-00c9bf)

No next show was started in songticker. This could mean that songticker itself is down somehow, or there could be an issue in our metadata that needs investigating.
Settings:

| Trigger Setting | Values |
| --------------- | ------ |
| Priority | WARNING |

```console
last(/Songticker/rabe.songticker.show_endtime)-time()<0
```

## Macros

The following Zabbix macros are configured via this template.

### Macro: `{$SONGTICKER.XML.ENDPOINT}`

Location of the generated XML file for Songticker

Default:

```console
https://songticker.rabe.ch/songticker/0.9.3/current.xml
```

## Dashboards

The following Zabbix dashboards are included in this template.

* Songticker: Overview

## License

This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright

Copyright (c) 2017 - 2025 [Radio Bern RaBe](http://www.rabe.ch)
