#!/bin/bash
#
# rabe-ntpdc-sysinfo.sh [value] <single>
#
# return a sysinfo value as string or optionally as single value (ie. float, int, etc)
#
# exit codes (for debugging)
# 0 - if all went well
# 1 - if calling ntpdc failed
# 2 - if the value sepcified was not found
# 3 - if stripping the value fails
# 255 - if no value was specified
#

readonly NTPDC_CMD="/sbin/ntpdc -c sysinfo"

# we always need a first arg
[ -z "$1" ] && exit 255

# if we are passed "single" as the second arg we only return the first part of the reponse
_SINGLE_AWK='{print $0}'
if [ "single" == "$2" ]; then 
    _SINGLE_AWK='{print $1}'
fi

# a simple awk script that grabs the value and returns 1 if noone is found
_FILTER_AWK="BEGIN {x=1} /^$1:/ {print \$2; x=0} END {exit x}"

# output value and exit with code as needed
$NTPDC_CMD | /bin/awk -F ":[ ]*" -- "${_FILTER_AWK}" | /bin/awk -- "${_SINGLE_AWK}"
r=( ${PIPESTATUS[*]} )
[[ "${r[*]}" == "0 0 0" ]] && exit 0
[[ ${r[0]} -gt 0 ]] && exit 1;
[[ ${r[1]} -gt 0 ]] && exit 2;
[[ ${r[2]} -gt 0 ]] && exit 3;
