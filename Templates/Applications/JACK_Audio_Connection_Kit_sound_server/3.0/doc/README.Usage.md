## Usage
1. Import the
   [`Template_App_JACK_Audio_Connection_Kit_sound_server_active.xml`](Template_App_JACK_Audio_Connection_Kit_sound_server_active.xml)
   into your Zabbix server (click on the `Raw` button to download).
2. Add the template to your host (or stack template)
3. In case you have more than one instance of `jackd` running, consider to use
   the `{$APP_JACKD_USER}` and/or `{$APP_JACKD_CMDLINE}` macros to filter for a
   specific instance.
4. Check if new data arrives
