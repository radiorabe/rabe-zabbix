## UserParameters

The following user parameters are available within [`rabe.carp.conf`](userparameters/rabe.carp.conf)

| Key | Description |
| --- | ----------- |
| `rabe.carp.vhid.discovery` | [Discovery rule](#discovery) for getting a list of all configured CARP virtual host IDs (vhid). Data gets parsed from the [`ifconfig`](https://www.freebsd.org/cgi/man.cgi?ifconfig(8)) output (`carp:` lines). |
| `rabe.carp.vip.discovery` | [Discovery rule](#discovery) for getting a list of all configured CARP virtual IP addresses. Data gets parsed from the [`ifconfig`](https://www.freebsd.org/cgi/man.cgi?ifconfig(8)) output (`inet` or `inet6` lines) |
| `rabe.carp.vhid.status` | CARP VHID status, returns the status of a CARP VHID, which is either `MASTER`, `BACKUP` or `INIT`.|
| `rabe.carp.vhid.advbase` | CARP VHID advbase, returns the advertisement base of a CARP VHID. |
| `rabe.carp.vhid.advskew` | CARP VHID advskew, returns the advertisement skew of a CARP VHID.|
