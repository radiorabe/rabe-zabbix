# Zabbix SNMPv2 Livewire monitoring
Monitoring of [Telos Alliance
Livewire](https://www.telosalliance.com/Axia/Livewire-AoIP-Networking) devices
via SNMPv2, such as the [Axia
xNodes](https://www.telosalliance.com/Axia/xNodes).

There are low-level discovery rules for detecting and monitoring the available
Livewire source and destination ports.

## Usage
1. Download the [MIB files for Axia
   xNodes](https://www.telosalliance.com/support/xNode-MIB-Files-for-SNMP-Support) 
2. Place the MIB files into your default MIB directory (usually
   `/usr/local/share/snmp/mibs`) and make sure that the Zabbix server loads
   them (see [Using and loading
   MIBs](http://www.net-snmp.org/wiki/index.php/TUT:Using_and_loading_MIBS)).
3. Restart your Zabbix server
4. Import the [Template_SNMPv2_Livewire.xml](Template_SNMPv2_Livewire.xml) into your Zabbix server.
5. Add the template to you host (or stack template)
6. Check if new data arrives

## Notes
### snmpwalk command
The following `snmpwalk` command might be helpful for debugging:
```bash
snmpwalk -v 2c -c public <HOST> TLS-SMI::livewire
```

This template is part of [RaBe's Zabbix template and helpers
collection](https://github.com/radiorabe/rabe-zabbix).
## Template SNMPv2 Livewire
Telos Alliance Livewire Audio over IP routing control based on TLS-LIVEWIRE-MIB.
### Macros
* `{$SNMP_COMMUNITY}` (default: public)
### Discovery
#### Livewire destinations (`rabe.snmp.livewire.destinations.discovery`)
Discovery of Livewire destinations.

Returns the following macros for each available Livewire destination
* `{#DST_INDEX}`
  * A unique value, greater than zero, for each destination (`TLS-LIVEWIRE-MIB::dstIndex`).
* {#DST_NAME}`
  * A textual string containing the label of the destination port (`TLS-LIVEWIRE-MIB::dstName`).
##### Item Prototypes
* Audio gain of destination port $1 (`rabe.snmp.livewire.dstAudioGain[{#DST_INDEX}]`)  
  Audio gain/attenuation trim [dB] of the destination port.
* Media address of destination port $1 (`rabe.snmp.livewire.dstMediaAddress[{#DST_INDEX}]`)  
  A textual string containing the destination media address (URI).
* Name of destination port $1 (`rabe.snmp.livewire.dstName[{#DST_INDEX}]`)  
  A textual string containing the label of the destination port.
* Number of audio channels of destination port $1 (`rabe.snmp.livewire.dstNumberOfChannels[{#DST_INDEX}]`)  
  The number of audio channels (0 - port not available, 1 - mono, 2 - stereo, 8 - 8-channel surround (5.1 + stereo)) of the destination port.
* Channel output mode of destination port $1 (`rabe.snmp.livewire.dstOutputMode[{#DST_INDEX}]`)  
  Channel output mode of destination port. Default mode is passing all channels. Mono destinations can be left-only, right-only or left+righ sum.
#### Livewire sources (`rabe.snmp.livewire.sources.discovery`)
Discovery of Livewire source ports.

Returns the following macros for each available Livewire source
* `{#SRC_INDEX}`
  * A unique value, greater than zero, for each source port (`TLS-LIVEWIRE-MIB::srcIndex`).
* {#SRC_NAME}`
  * A textual string containing the label of the source port (`TLS-LIVEWIRE-MIB::srcName`).
##### Item Prototypes
* Audio gain of source port $1 (`rabe.snmp.livewire.srcAudioGain[{#SRC_INDEX}]`)  
  Audio gain/attenuation trim [dB] of the source port.
* Enable status of source port $1 (`rabe.snmp.livewire.srcEnable[{#SRC_INDEX}]`)  
  Status of the source port, true(1) if the port is enabled, false(2) otherwise. A source port needs to be enabled in order to transmit multicast streams or accept unicast connections.
* Media address of source port $1 (`rabe.snmp.livewire.srcMediaAddress[{#SRC_INDEX}]`)  
  IPv4 multicast destination address for the RTP media stream, or empty (0.0.0.0) for unicast-only ports.
* Name of source port $1 (`rabe.snmp.livewire.srcName[{#SRC_INDEX}]`)  
  A textual string containing the label of the source port.
* Number of audio channels of source port $1 (`rabe.snmp.livewire.srcNumberOfChannels[{#SRC_INDEX}]`)  
  The number of audio channels (0 - port not available, 1 - mono, 2 - stereo, 8 - 8-channel surround (5.1 + stereo)) of the destination port.
* Packet size of source port $1 (`rabe.snmp.livewire.srcPacketSize[{#SRC_INDEX}]`)  
  The number of samples per each RTP media packet.
Common values are:
* 12 - Livewire Livestreams (channels with mininum latency)
* 48 - AES67 1ms packet (low-latency, best interoperability)
* 240 - Livewire Standard Streams (least resource intensive)

## License
This template is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License.

## Copyright
Copyright (c) 2017 [Radio Bern RaBe](http://www.rabe.ch)
