#
# spec file for package rabe-zabbix
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

Name:          rabe-zabbix
Version:       0.3.1
Release:       0
Summary:       RaBe Zabbix scripts and configs
License:       AGPLv3
Source:        rabe-zabbix-%{version}.tar.gz

BuildArch:     noarch

Requires:      zabbix-agent
# requires for selinux packaging, see https://fedoraproject.org/wiki/SELinux_Policy_Modules_Packaging_Draft
BuildRequires: checkpolicy, selinux-policy-devel, /usr/share/selinux/devel/policyhelp
%{!?_selinux_policy_version: %global _selinux_policy_version %(sed -e 's,.*selinux-policy-\\([^/]*\\)/.*,\\1,' /usr/share/selinux/devel/policyhelp 2>/dev/null)}
%if "%{_selinux_policy_version}" != ""
Requires:      selinux-policy >= %{_selinux_policy_version}
%endif
Requires(post):   /usr/sbin/semodule, /sbin/restorecon, /sbin/fixfiles
Requires(postun): /usr/sbin/semodule, /sbin/restorecon, /sbin/fixfiles

%description
Contains helper scripts, UserParameter configs, SELinux policies and sudoers to be used at RaBe for monitoring all the things.

%prep
%setup -q -n %{name}-%{version}

%build
make -j2 build

%install
make install PREFIX=%{buildroot}%{_prefix} ETCDIR=%{buildroot}%{_sysconfdir}

%post
for policy in `cat %{_datadir}/selinux/targeted/rabe.lst`; do
  /usr/sbin/semodule -s targeted -i %{_datadir}/selinux/targeted/${policy}.pp &> /dev/null || :
done
/sbin/fixfiles -R rabe-zabbix restore || :

%preun
if [ $1 -eq 0 ] ; then
  for policy in `cat %{_datadir}/selinux/targeted/rabe.lst`; do
    /usr/sbin/semodule -s targeted -r ${policy} &> /dev/null || :
  done
  /sbin/fixfiles -R rabe-zabbix restore || :
fi

%files
%doc LICENSE README.md
%defattr(-,root,root,-)
%{_datadir}/selinux/*/rabe.lst
%{_datadir}/selinux/*/*.pp
%config %{_sysconfdir}/zabbix/zabbix_agentd.d/*.conf
%config %{_sysconfdir}/sudoers.d/*
%{_libexecdir}/zabbix/rabe/*
