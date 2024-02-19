## UserParameters

| Key | Description |
| --- | ----------- |
| `rabe.ntpd.server.discovery` | List of configured servers in ntp.conf for low level discovery |
| `rabe.ntpd.server.candidate_order[<server>]` | Candidate order of a known peer (0 if peer is not a candidate) |
| `rabe.ntpdc.sysinfo[<value name>[,"single"]]` | Get value by name from `ntpdc -c sysinfo` using `rabe-ntpdc-sysinfo.sh` script (use "single" as "$2" if you only need the first value up to a whitespace) |
