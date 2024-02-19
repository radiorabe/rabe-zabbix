## UserParameters

The following user parameters are available within
[`rabe.md-raid.conf`](userparameters/rabe.md-raid.conf) (including some
in-depth parameter description):

| Key | Description |
| --- | ----------- |
| `rabe.raid.md.raid-device.discovery` | Discovery rule for getting a list of all raid devices (MD) |
| `rabe.raid.md.component-device.discovery` | Discovery rule for getting a list of all component devices (RD) |
| `rabe.raid.md.component-device.block-dev[<md device name>,<rd device name>]` | Block device name of a specific component device (RD) |
