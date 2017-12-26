#!/usr/bin/make -f
#
# Makefile for package rabe-zabbix
#
# Copyright (c) 2017 Radio Bern RaBe
#                    http://www.rabe.ch
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public 
# License as published  by the Free Software Foundation, version
# 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License  along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#
# Please submit enhancements, bugfixes or comments via GitHub:
# https://github.com/radiorabe/rabe-zabbix
#

PN               = rabe

PREFIX          ?= /usr/local
ETCDIR          ?= ${PREFIX}/etc
DATADIR          = ${PREFIX}/share
LIBEXECDIR       = ${PREFIX}/libexec
SELINUXDIR       = ${DATADIR}/selinux
AGENTDDIR        = ${ETCDIR}/zabbix/zabbix_agentd.d
AGENTEXECDIR     = ${LIBEXECDIR}/zabbix/${PN}
SUDOERSDIR       = ${ETCDIR}/sudoers.d

# from package selinux-policy-devel
SELINUX_MAKEFILE = /usr/share/selinux/devel/Makefile

APPS             = $(notdir $(wildcard app/*))
IPMIS            = $(notdir $(wildcard ipmi/*))
SNMPS            = $(notdir $(wildcard snmp/*))

# Filter out special packages, which doesn't provide a Zabbix template XML for
# example or have a legacy static documentation.
IPMIS            := $(filter-out Sensor_Discovery, $(IPMIS))
SNMPS            := $(filter-out README.md \
								 SNMPv2_Generic \
								 SNMPv2_Interfaces_HC \
								 SNMPv2_Netgear_Box_Services \
								 SNMPv2_Netgear_Inventory \
								 SNMPv2_Netgear_SNTP_client \
								 SNMPv2_Netgear_Switching, $(SNMPS))

update-app-doc:
	$(foreach app,$(APPS), \
	    xsltproc \
	    	--output app/$(app)/README.md \
	        --stringparam appName '$(app)' \
	        --stringparam appHead "`cat app/$(app)/doc/README.head.md`" \
	        --stringparam selinuxDoc "`[ -f app/$(app)/doc/README.SELinux.md ] && cat app/$(app)/doc/README.SELinux.md`" \
	        --stringparam userparamDoc "`[ -f app/$(app)/doc/README.UserParameters.md ] && cat app/$(app)/doc/README.UserParameters.md`" \
	        --stringparam scriptDoc "`[ -f app/$(app)/doc/README.scripts.md ] && cat app/$(app)/doc/README.scripts.md`" \
	    	update-app-doc.xsl app/$(app)/*.xml; \
	)

update-impi-doc:
	$(foreach ipmi,$(IPMIS), \
	    xsltproc \
	        --output ipmi/$(ipmi)/README.md \
	        --stringparam appName '$(ipmi)' \
	        --stringparam appHead "`cat ipmi/$(ipmi)/doc/README.head.md`" \
	        --stringparam selinuxDoc "`[ -f ipmi/$(ipmi)/doc/README.SELinux.md ] && cat ipmi/$(ipmi)/doc/README.SELinux.md`" \
	        --stringparam userparamDoc "`[ -f ipmi/$(ipmi)/doc/README.UserParameters.md ] && cat ipmi/$(ipmi)/doc/README.UserParameters.md`" \
	        --stringparam scriptDoc "`[ -f ipmi/$(ipmi)/doc/README.scripts.md ] && cat ipmi/$(ipmi)/doc/README.scripts.md`" \
	        update-app-doc.xsl ipmi/$(ipmi)/*.xml; \
	)

update-snmp-doc:
	$(foreach snmp,$(SNMPS), \
	    xsltproc \
	        --output snmp/$(snmp)/README.md \
	        --stringparam appName '$(snmp)' \
	        --stringparam appHead "`cat snmp/$(snmp)/doc/README.head.md`" \
	        --stringparam scriptDoc "`[ -f snmp/$(snmp)/doc/README.scripts.md ] && cat snmp/$(snmp)/doc/README.scripts.md`" \
	        update-app-doc.xsl snmp/$(snmp)/*.xml; \
	)

.PHONY: update-all
update-all: update-app-doc update-impi-doc update-snmp-doc

.PHONY: update
update: update-all ## Update buildable docs from xml and docs/ directories.

build-app-selinux:
# SELinux type enforcement files are named rabezbx<app>.te and will result
# in a SELinux module name of rabezbx<app>
	$(foreach teFile,$(wildcard app/*/selinux/rabezbx*.te), \
		make -C $(dir $(teFile)) -f $(SELINUX_MAKEFILE) \
			PREFIX=/usr NAME=$(notdir $(basename $(teFile))) \
		&& echo -n "$(notdir $(basename $(teFile))) " >> rabe.lst; \
	)

.PHONY: build-app
build-app: build-app-selinux

.PHONY: build-selinux
build-selinux: build-app-selinux ## Build SELinux modules.

.PHONY: build-all
build-all: build-app

.PHONY: build
build: build-all ## Build everything.

.PHONY: test-app
test-app:

.PHONY: test
test: all test-app

# install a SELinux policy per app that matches the rabezbx*.pp files
.PHONY: install-app-selinux
install-app-selinux:
	install -d $(SELINUXDIR)/targeted
	install -p -m 644 app/*/selinux/rabezbx*.pp $(SELINUXDIR)/targeted
	install -p -m 644 rabe.lst  $(SELINUXDIR)/targeted

# install a userparameters config file per app that matches the *.conf files
.PHONY: install-app-config
install-app-config:
	install -d $(AGENTDDIR)
	install -p -m 644 app/*/userparameters/*.conf $(AGENTDDIR)

# install any scripts found in a */scripts/* subdir
# they all get put into /var/libexec/zabbix/rabe and you need to take care not
# to clash with existing scripts when adding new ones
.PHONY: install-scripts
install-scripts:
	install -d $(AGENTEXECDIR)
	$(foreach script,$(wildcard */*/scripts/*), \
		install -p -m 755 $(script) $(AGENTEXECDIR); \
	)

# install sudoers config droplets per app that matches the sudoers.d file
# naming policy prefix
.PHONY: install-app-sudoers
install-app-sudoers:
	install -d $(SUDOERSDIR)
	install -p -m 600 app/*/sudoers.d/rabezbx-* $(SUDOERSDIR)

.PHONY: install-app
install-app: install-app-selinux install-app-config install-scripts \
	     install-app-sudoers

.PHONY: install
install: install-app ## Install rabe-zabbix to $(PREFIX)

.PHONY: clean-app
clean-app:
	rm -rf rabe.lst
	$(foreach app,$(APPS), \
	    rm -rf app/$(app)/selinux/*.pp app/$(app)/selinux/tmp; \
	)

.PHONY: clean
clean: clean-app ## Clean working copy

.PHONY: help
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
	    awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: build test
