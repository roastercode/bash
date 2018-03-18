#!/bin/bash

# DEBUG ACTIVATION
#set -x

# --------------------------------------------------------------------
# Information Variables
# --------------------------------------------------------------------
AUTHOR="(C) 2016 Loic Vaillant"
REVIEWER="2017 Aurélen DESBRIERES"

# --------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------
NRDP_CMD=/root/NRDP/send_nrdp.sh
NAGIOS_TARGET="http://11.1.31.6/nrdp/"
NAGIOS_TOKEN="8e7ibinkbgsj"
HOSTNAME="nagiosPOC"
SERVICE=""

# --------------------------------------------------------------------
# Library
# --------------------------------------------------------------------
# Include lib to send the xml data
source /opt/lib/nstats/test/xml_lib

# --------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------
PROGNAME=$(basename "$0")

LIBEXEC="/usr/local/nagios/libexec"
for i in ${LIBEXEC} ; do
	[ -r ${i}/utils.sh ] && . ${i}/utils.sh
done

if [ -z "$STATE_OK" ]; then
	echo "nagios utils.sh not found" &>/dev/stderr
	exit 1
fi

# --------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------
usage() {
echo "Usage: $PROGNAME -H"
echo "Usage: $PROGNAME -S"
echo "Usage: $PROGNAME -h,--help"
echo "Options:"
echo " -H	Hosts statistics"
echo " -S	Services statistics"
echo "Author: $AUTHOR"
echo "Reviewer: $REVIEWER"
}


while [ "$1" != "" ]; do
	case "$1" in
		-H) NAGIOSOPT="NUMHOSTS,NUMHSTUP,NUMHSTDOWN,NUMHSTUNR,NUMHSTPROB"; CMD="host"; SERVICE="Hosts statistics"; shift 1;;
		-S) NAGIOSOPT="NUMSERVICES,NUMSVCOK,NUMSVCWARN,NUMSVCUNKN,NUMSVCCRIT,NUMSVCPROB"; CMD="service"; SERVICE="Services statistics"; shift 1;;
		-m) MODE=$2; shift 2;;
		--help) usage; exit "$STATE_OK";;
		-h) usage; exit "$STATE_OK";;
	*) usage; exit "$STATE_UNKNOWN";;
esac
done

STATS=$(/usr/local/nagios/bin/nagiostats -m -D " " -d $NAGIOSOPT)
STATE=$STATE_OK

unset IFS
read -ra arr -d '' <<<"$STATS"

case $CMD in
	"host")
		OUTPUT="Hosts statistics: Total=${arr[0]} - Up=${arr[1]} - Down=${arr[2]} - Unreachable=${arr[3]} - Problem=${arr[4]}|Total=${arr[0]};;;0;${arr[0]} Up=${arr[1]};;;0;${arr[0]} Down=${arr[2]};;;0;${arr[0]} Unreachable=${arr[3]};;;0;${arr[0]} Problem=${arr[4]};;;0;${arr[0]}"
		;;
	"service")

		OUTPUT="Services statistics: Total=${arr[0]} - OK=${arr[1]} - Warning=${arr[2]} - Unknown=${arr[3]} - Critical=${arr[4]} - Problem=${arr[5]}|Total=${arr[0]};;;0;${arr[0]} OK=${arr[1]};;;0;${arr[0]} Warning=${arr[2]};;;0;${arr[0]} Unknown=${arr[3]};;;0;${arr[0]} Critical=${arr[4]};;;0;${arr[0]} Problem=${arr[5]};;;0;${arr[0]}"
		;;
esac

case $MODE in
	"active")
		echo "$OUTPUT"
		;;
	"passive")
		passiveMode
		;;
	*)
		usage
		exit "$STATE_CRITICAL"
		;;
esac

exit "$STATE"
