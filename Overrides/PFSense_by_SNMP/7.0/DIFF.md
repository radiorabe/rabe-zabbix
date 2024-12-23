# Compare Rabe Override with Upstream Template

Original: [PFSense by SNMP](https://raw.githubusercontent.com/zabbix/zabbix/release/7.0/templates/app/pfsense_snmp/template_app_pfsense_snmp.yaml)

## Diff

```diff
--- before
+++ after
@@ -31,6 +31,7 @@
           type: SNMP_AGENT
           snmp_oid: '.1.3.6.1.2.1.25.4.2.1.7["index",".1.3.6.1.2.1.25.4.2.1.2","dhcpd"]'
           key: pfsense.dhcpd.status
+          history: 7d
           description: |
             MIB: HOST-RESOURCES-MIB
             The status of DHCP server process.
@@ -60,6 +61,7 @@
           type: SNMP_AGENT
           snmp_oid: '.1.3.6.1.2.1.25.4.2.1.7["index",".1.3.6.1.2.1.25.4.2.1.2","unbound"]'
           key: pfsense.dns.status
+          history: 7d
           description: |
             MIB: HOST-RESOURCES-MIB
             The status of DNS server process.
@@ -89,6 +91,7 @@
           type: SNMP_AGENT
           snmp_oid: '.1.3.6.1.2.1.25.4.2.1.7["index",".1.3.6.1.2.1.25.4.2.1.2","nginx"]'
           key: pfsense.nginx.status
+          history: 7d
           description: |
             MIB: HOST-RESOURCES-MIB
             The status of nginx process.
@@ -118,6 +121,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.2.0
           key: pfsense.packets.bad.offset
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -135,6 +139,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.3.0
           key: pfsense.packets.fragment
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -152,6 +157,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.1.0
           key: pfsense.packets.match
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -169,6 +175,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.6.0
           key: pfsense.packets.mem.drop
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -186,6 +193,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.5.0
           key: pfsense.packets.normalize
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -203,6 +211,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.2.4.0
           key: pfsense.packets.short
+          history: 7d
           value_type: FLOAT
           units: pps
           description: |
@@ -220,6 +229,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.1.1.0
           key: pfsense.pf.status
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             True if packet filter is currently enabled.
@@ -245,6 +255,7 @@
           type: SNMP_AGENT
           snmp_oid: .1.3.6.1.4.1.12325.1.200.1.11.1.0
           key: pfsense.rules.count
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             The number of labeled filter rules on this system.
@@ -256,6 +267,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.4.1.0
           key: pfsense.source.tracking.table.count
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             Number of entries in the source tracking table.
@@ -267,6 +279,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.5.2.0
           key: pfsense.source.tracking.table.limit
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             Maximum number of 'sticky-address' or 'source-track' rules in the ruleset.
@@ -277,6 +290,7 @@
           name: 'Source tracking table utilization in %'
           type: CALCULATED
           key: pfsense.source.tracking.table.pused
+          history: 7d
           value_type: FLOAT
           units: '%'
           params: 'last(//pfsense.source.tracking.table.count) * 100 / last(//pfsense.source.tracking.table.limit)'
@@ -300,6 +314,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.3.1.0
           key: pfsense.state.table.count
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             Number of entries in the state table.
@@ -311,6 +326,7 @@
           type: SNMP_AGENT
           snmp_oid: 1.3.6.1.4.1.12325.1.200.1.5.1.0
           key: pfsense.state.table.limit
+          history: 7d
           description: |
             MIB: BEGEMOT-PF-MIB
             Maximum number of 'keep state' rules in the ruleset.
@@ -321,6 +337,7 @@
           name: 'States table utilization in %'
           type: CALCULATED
           key: pfsense.state.table.pused
+          history: 7d
           value_type: FLOAT
           units: '%'
           params: 'last(//pfsense.state.table.count) * 100 / last(//pfsense.state.table.limit)'
@@ -343,6 +360,7 @@
           name: 'SNMP agent availability'
           type: INTERNAL
           key: 'zabbix[host,snmp,available]'
+          history: 7d
           description: |
             Availability of SNMP checks on the host. The value of this item corresponds to availability icons in the host list.
             Possible values:
@@ -425,6 +443,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.8["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.block.v4.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -450,6 +469,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.12["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.block.v4.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -472,6 +492,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.16["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.block.v6.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -497,6 +518,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.20["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.block.v6.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -519,6 +541,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.13.{#SNMPINDEX}'
               key: 'net.if.in.discards[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 The number of inbound packets which were chosen to be discarded
@@ -542,6 +565,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.14.{#SNMPINDEX}'
               key: 'net.if.in.errors[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 For packet-oriented interfaces, the number of inbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of inbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.
@@ -577,6 +601,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.7["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.pass.v4.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -602,6 +627,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.11["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.pass.v4.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -624,6 +650,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.15["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.pass.v6.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -649,6 +676,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.19["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.in.pass.v6.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -671,6 +699,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.31.1.1.1.6.{#SNMPINDEX}'
               key: 'net.if.in[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: IF-MIB
@@ -694,6 +723,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.10["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.block.v4.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -719,6 +749,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.14["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.block.v4.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -741,6 +772,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.18["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.block.v6.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -766,6 +798,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.22["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.block.v6.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -788,6 +821,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.19.{#SNMPINDEX}'
               key: 'net.if.out.discards[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 The number of outbound packets which were chosen to be discarded
@@ -811,6 +845,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.20.{#SNMPINDEX}'
               key: 'net.if.out.errors[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 For packet-oriented interfaces, the number of outbound packets that contained errors preventing them from being deliverable to a higher-layer protocol.  For character-oriented or fixed-length interfaces, the number of outbound transmission units that contained errors preventing them from being deliverable to a higher-layer protocol. Discontinuities in the value of this counter can occur at re-initialization of the management system, and at other times as indicated by the value of ifCounterDiscontinuityTime.
@@ -846,6 +881,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.9["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.pass.v4.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -871,6 +907,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.13["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.pass.v4.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -893,6 +930,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.17["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.pass.v6.bps[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -918,6 +956,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.21["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.out.pass.v6.pps[{#SNMPINDEX}]'
+              history: 7d
               units: pps
               description: |
                 MIB: BEGEMOT-PF-MIB
@@ -940,6 +979,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.31.1.1.1.10.{#SNMPINDEX}'
               key: 'net.if.out[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: IF-MIB
@@ -963,6 +1003,7 @@
               type: SNMP_AGENT
               snmp_oid: '.1.3.6.1.4.1.12325.1.200.1.8.2.1.6["index",".1.3.6.1.4.1.12325.1.200.1.8.2.1.2","{#IFDESCR}"]'
               key: 'net.if.rules.refs[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: BEGEMOT-PF-MIB
                 The number of rules referencing this interface.
@@ -980,6 +1021,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.31.1.1.1.15.{#SNMPINDEX}'
               key: 'net.if.speed[{#SNMPINDEX}]'
+              history: 7d
               units: bps
               description: |
                 MIB: IF-MIB
@@ -1003,6 +1045,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.8.{#SNMPINDEX}'
               key: 'net.if.status[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 The current operational state of the interface.
@@ -1043,6 +1086,7 @@
               type: SNMP_AGENT
               snmp_oid: '1.3.6.1.2.1.2.2.1.3.{#SNMPINDEX}'
               key: 'net.if.type[{#SNMPINDEX}]'
+              history: 7d
               description: |
                 MIB: IF-MIB
                 The type of interface.
@@ -1978,6 +2022,13 @@
               newvalue: 'not running'
             - value: '2'
               newvalue: running
+        - uuid: c3c721156c624317af993e1a263c16bc
+          name: 'Service state'
+          mappings:
+            - value: '0'
+              newvalue: Down
+            - value: '1'
+              newvalue: Up
         - uuid: f6bb441b7a65446c96c546bd3f3140ee
           name: 'SNMPv2-TC::TruthValue'
           mappings:


```
