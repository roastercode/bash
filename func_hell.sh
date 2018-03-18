#!/bin/bash
# function (simple)

# debug
#set -x

DEFAULT=default
#MAN=$MANWIDTH=80
MAN1="man snmpwalk"
MAN2="man mib2c"
MAN3="man snmptrap"

snmp_walk () {
    "$MAN1"
    "$MAN2"
    "$MAN3"
}
