# Zabbix JACK Audio Connection Kit sound server monitoring
Monitoring of the [JACK Audio Connection Kit sound server](http://www.jackaudio.org).

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).

## Usage
1. Import the
   [`Template_App_JACK_Audio_Connection_Kit_sound_server_active.xml`](Template_App_JACK_Audio_Connection_Kit_sound_server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. In case you have more than one instance of `jackd` running, consider to use
   the `{$APP_JACKD_USER}` and/or `{$APP_JACKD_CMDLINE}` macros to filter for a
   specific instance.
4. Check if new data arrives
## Template App JACK Audio Connection Kit sound server active
Application template for [JACK Audio Connection Kit sound server](http://www.jackaudio.org).
### Items
* CPU utilization (total) of "jackd" process(es) (avg5, running as user {$APP_JACKD_USER} with cmdline filter {$APP_JACKD_CMDLINE}) in % (`proc.cpu.util[jackd,{$APP_JACKD_USER},total,{$APP_JACKD_CMDLINE},avg5]`)  
  5 minute average CPU utilization in percent of the `jackd` process(es).

Use the `{$APP_JACKD_USER}` and/or `{$APP_JACKD_CMDLINE}` macros to filter for a specific instance.
* Memory usage (rss) of "jackd" process(es) (running as user {$APP_JACKD_USER} with cmdline filter {$APP_JACKD_CMDLINE}) (`proc.mem[jackd,{$APP_JACKD_USER},,{$APP_JACKD_CMDLINE},rss]`)  
  The RSS memory usage of the `jackd` process(es).

Use the `{$APP_JACKD_USER}` and/or `{$APP_JACKD_CMDLINE}` macros to filter for a specific instance.
* Number of "jackd" process(es) (running as user {$APP_JACKD_USER} with cmdline filter {$APP_JACKD_CMDLINE}) (`proc.num[jackd,{$APP_JACKD_USER},,{$APP_JACKD_CMDLINE}]`)  
  The number of running `jackd` processes.

Use the `{$APP_JACKD_USER}` and/or `{$APP_JACKD_CMDLINE}` macros to filter for a specific instance.
### Macros
* `{$APP_JACKD_CMDLINE}` (default: .*)
* `{$APP_JACKD_USER}` (default: )
### Triggers
* High: No running jackd process(es) (running as user {$APP_JACKD_USER} with cmdline filter {$APP_JACKD_CMDLINE}) on {HOST.NAME}
  ```
  {Template App JACK Audio Connection Kit sound server active:proc.num[jackd,{$APP_JACKD_USER},,{$APP_JACKD_CMDLINE}].last(0)}<1
  ```
  There is no running `jackd` process (JACK Audio Connection Kit sound server) on this host.

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 - 2019 [Radio Bern RaBe](http://www.rabe.ch)
