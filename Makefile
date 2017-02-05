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

# from package selinux-policy-devel
SELINUX_MAKEFILE = /usr/share/selinux/devel/Makefile

APPS             = $(notdir $(wildcard app/*))

make-app-selinux:
	$(foreach app,$(APPS), \
	    make -C app/$(app)/selinux NAME=rabezbx$(subst -,,$(app)) -f ${SELINUX_MAKEFILE} || :; \
	)
	$(foreach app,$(APPS), \
	    [[ -d app/$(app)/selinux ]] && echo -n 'rabezbx$(subst -,,$(app)) ' >> rabe.lst; \
	)

make-app: make-app-selinux

make-all: make-app

make: make-all

test-app:

test: all test-app

# install a policy per app that matches the rabezbx<app> policy naming policy
# allowed to fail since not all apps have such a policy
install-app-selinux:
	install -d $(SELINUXDIR)/targeted
	$(foreach app,$(APPS), \
	    install -p -m 644 app/$(app)/selinux/rabezbx$(subst -,,$(app)).pp  $(SELINUXDIR)/targeted || :; \
	)
	install -p -m 644 rabe.lst  $(SELINUXDIR)/targeted

# install a userparameters config file per app that matches the <app>.conf config file naming policy
# allowed to fail for for apps without such a config
install-app-config:
	install -d $(AGENTDDIR)
	$(foreach app,$(APPS), \
	    for config in `find -path '*/userparameters/*' -name '*.conf'`; do \
	        install -p -m 644 $$config $(AGENTDDIR) || :; \
	    done; \
	)

# install any scripts found in a */scripts/* subdir
# they all get put into /var/libexec/zabbix/rabe and you need to take care not to clash with existing scripts when adding new ones
install-scripts:
	install -d $(AGENTEXECDIR)
	for script in `find -path '*/scripts/*' -type f`; do \
	    install -p -m 755 $$script $(AGENTEXECDIR); \
	done

install-app: install-app-selinux install-app-config install-scripts

install: install-app

clean-app:
	rm -rf rabe.lst
	$(foreach app,$(APPS), \
	    rm -rf app/$(app)/selinux/*.pp app/$(app)/selinux/tmp; \
	)

clean: clean-app

all: make test
