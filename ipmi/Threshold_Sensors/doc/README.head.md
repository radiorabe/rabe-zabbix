Monitoring of auto-discovered IPMI threshold sensors (Temperature, Voltage,
Current and Fan types).

An external script is used for low-level discovery of the sensors (as Zabbix
currently lacks LLD of IPMI sensors).

Triggers will be created for each discovered sensor, according to their
advertised lower and upper non-critical, critical and non-recoverable
thresholds.
