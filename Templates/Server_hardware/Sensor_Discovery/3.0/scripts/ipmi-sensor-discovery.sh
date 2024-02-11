#!/bin/bash
################################################################################
# ipmi-sensor-discovery.sh - Zabbix IPMI sensor low-level discovery
################################################################################
#
# Copyright (C) 2017 Radio Bern RaBe
#                    Switzerland
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
# Please submit enhancements, bugfixes or comments via:
# https://github.com/radiorabe/rabe-zabbix
#
# Authors:
#  Christian Affolter <c.affolter@purplehaze.ch>
#
# Description:
# This script is intended to be used for Zabbix low-level discovery of IPMI
# sensors, as Zabbix currently lacks LLD for IPMI item.
#
# It uses FreeIPMI's "ipmi-sensors" command to produce a list of available
# sensors and transforms the output into the Zabbix LLD JSON format.
# One is supposed to run this script as an external script on a Zabbix server
# or proxy within a LLD rule.
# The script lists all available sensors of a given IPMI host by default.
# Optionally, the sensor list can be limited to one or multiple (comma separated)
# senor types (see "ipmi-sensors --list-sensor-types").
#
# Refer to the awk command below for a list of LLD macros.
#
# Usage:
# ipmi-sensor-discovery.sh IPMI-HOST IPMI-USER IPMI-PASSWORD [IPMI-SENSOR-TYPES]
#
set -o pipefail

export LC_ALL="C"

IPMI_SENSORS_CMD="/usr/sbin/ipmi-sensors"
AWK_CMD="/usr/bin/awk"

ipmiHost="$1"
ipmiUser="$2"
ipmiPassword="$3"
ipmiSensorTypes="$4"

if test -z "${ipmiHost}"; then
    echo "Missing IPMI host as the first parameter" >&2
    exit 1
fi

if test -z "${ipmiUser}"; then
    echo "Missing IPMI user as the second parameter" >&2
    exit 1
fi

if test -z "${ipmiPassword}"; then
    echo "Missing IPMI password as the third parameter" >&2
    exit 1
fi

# Specifying the IPMI sensor types is optional
test -z "${ipmiSensorTypes}" && ipmiSensorTypes="all"

for cmd in ${IPMI_SENSORS_CMD} ${AWK_CMD}; do
    if ! test -x "${cmd}"; then
        echo "Command ${cmd} not found or executable" >&2 
        exit 2
    fi
done


${IPMI_SENSORS_CMD} --driver-type=LAN \
                    --hostname="${ipmiHost}" \
                    --username="${ipmiUser}" \
                    --password="${ipmiPassword}" \
                    --privilege-level=USER \
                    --sensor-types="${ipmiSensorTypes}" \
                    --output-sensor-thresholds \
                    --ignore-not-available-sensors \
                    --comma-separated-output \
                    --no-header-output \
                    --quiet-cache \
                    --sdr-cache-recreate 2>/dev/null | ${AWK_CMD} '
BEGIN {
    FS = "," # Fields are separated by comma (CSV output)
    printf "{"
    printf "\n   \"data\" : ["

    sep="" # Initialize the object separator empty on the first run
}

{
    # ID,Name,Type,Reading,Units,Lower NR,Lower C,Lower NC,Upper NC,Upper C,Upper NR,Event
    printf sep
    printf "\n      {"
    printf "\n         \"{#IPMI_SENSOR_ID}\" : \""$1"\","
    printf "\n         \"{#IPMI_SENSOR_NAME}\" : \""$2"\","
    printf "\n         \"{#IPMI_SENSOR_TYPE}\" : \""$3"\","
    printf "\n         \"{#IPMI_SENSOR_READING}\" : \""$4"\","
    printf "\n         \"{#IPMI_SENSOR_UNITS}\" : \""$5"\","
    printf "\n         \"{#IPMI_SENSOR_LOWER_NR}\" : \""$6"\","
    printf "\n         \"{#IPMI_SENSOR_LOWER_C}\" : \""$7"\","
    printf "\n         \"{#IPMI_SENSOR_LOWER_NC}\" : \""$8"\","
    printf "\n         \"{#IPMI_SENSOR_UPPER_NC}\" : \""$9"\","
    printf "\n         \"{#IPMI_SENSOR_UPPER_C}\" : \""$10"\","
    printf "\n         \"{#IPMI_SENSOR_UPPER_NR}\" : \""$11"\","
    printf "\n         \"{#IPMI_SENSOR_EVENT}\" : \""$12"\""
    printf "\n      }"

    sep = ","
}

END {
    printf "\n   ]"
    printf "\n}"
}
'
