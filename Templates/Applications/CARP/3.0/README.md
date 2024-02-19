# Zabbix CARP monitoring
Monitoring the [Common Address Redundancy Protocol (CARP)](https://www.freebsd.org/doc/handbook/carp.html) on FreeBSD systems.

There are custom [low-level discovery](https://www.zabbix.com/documentation/3.0/manual/discovery/low_level_discovery)
rules for detecting all the configured Virtual Host IDs (VHID) and virtual IP
addresses as well as user parameters for monitoring the current status of VHIDs
and VIPs.  Refer to the
[CARP(4)](https://www.freebsd.org/cgi/man.cgi?query=carp&amp;sektion=4) man page
for more information regarding CARP.

The discovery rules and user parameters were tested on
[pfSense](http://pfsense.org/) based systems but should work on all
[FreeBSD](https://www.freebsd.org) 10 and later systems.

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage

1. Import the [`Template_App_CARP_active.xml`](Template_App_CARP_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. Check if new data arrives

## Template App CARP active
Application template for monitoring the Common Address Redundancy Protocol (CARP) on FreeBSD network interfaces.
- https://www.freebsd.org/doc/handbook/carp.html
- https://www.freebsd.org/cgi/man.cgi?query=carp&sektion=4
### Discovery
#### CARP vhid discovery (`rabe.carp.vhid.discovery`)
Low-Level discovery of FreeBSD's configured CARP virtual host IDs (vhid).

Returns the following example macro for each configured vhid:
{#CARP_VHID} = 3
##### Item Prototypes
* CARP advbase of vhid $1 (`rabe.carp.vhid.advbase[{#CARP_VHID}]`)  
  The current advertisement base in seconds of a specific CARP virtual host ID (vhid).
* CARP advskew of vhid $1 (`rabe.carp.vhid.advskew[{#CARP_VHID}]`)  
  The current advertisement skew in 1/256 second (as per the carp(4) man page) of a specific CARP virtual host ID (vhid).
* CARP status of vhid $1 (`rabe.carp.vhid.status[{#CARP_VHID}]`)  
  The current status of a specific CARP virtual host ID (vhid).
##### Trigger Prototypes
* Information: CARP status of VHID {#CARP_VHID} changed to {ITEM.VALUE1} on {HOST.NAME}
  ```
  {Template App CARP active:rabe.carp.vhid.status[{#CARP_VHID}].diff()}>0
  ```
  The CARP virtual host ID (vhid) changed its status.
#### CARP vip discovery (`rabe.carp.vip.discovery`)
Low-Level discovery of FreeBSD's configured CARP virtual IP addresses (vip).

Returns the following example macro pair for each configured CARP VIP
{#CARP_IP} = 192.0.2.10
{#CARP_VHID} = 3
##### Item Prototypes
* CARP status of VIP $2 in vhid $1 (`rabe.carp.vhid.status[{#CARP_VHID},{#CARP_IP}]`)  
  The current status of a specific CARP virtual IP address within a virtual host ID (vhid) group.
##### Trigger Prototypes
* Information: CARP status of VIP {#CARP_IP} (VHID {#CARP_VHID}) changed to {ITEM.VALUE1} on {HOST.NAME}
  ```
  {Template App CARP active:rabe.carp.vhid.status[{#CARP_VHID},{#CARP_IP}].diff()}>0
  ```
  The CARP virtual IP address (vip) within a virtual host ID (vhid) group changed its status.
## UserParameters

The following user parameters are available within [`rabe.carp.conf`](userparameters/rabe.carp.conf)

| Key | Description |
| --- | ----------- |
| `rabe.carp.vhid.discovery` | [Discovery rule](#discovery) for getting a list of all configured CARP virtual host IDs (vhid). Data gets parsed from the [`ifconfig`](https://www.freebsd.org/cgi/man.cgi?ifconfig(8)) output (`carp:` lines). |
| `rabe.carp.vip.discovery` | [Discovery rule](#discovery) for getting a list of all configured CARP virtual IP addresses. Data gets parsed from the [`ifconfig`](https://www.freebsd.org/cgi/man.cgi?ifconfig(8)) output (`inet` or `inet6` lines) |
| `rabe.carp.vhid.status` | CARP VHID status, returns the status of a CARP VHID, which is either `MASTER`, `BACKUP` or `INIT`.|
| `rabe.carp.vhid.advbase` | CARP VHID advbase, returns the advertisement base of a CARP VHID. |
| `rabe.carp.vhid.advskew` | CARP VHID advskew, returns the advertisement skew of a CARP VHID.|

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
