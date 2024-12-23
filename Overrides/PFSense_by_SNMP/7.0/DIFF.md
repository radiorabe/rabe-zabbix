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
@@ -1978,6 +1996,13 @@
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
