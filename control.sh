#!/usr/bin/env BASH
#set -x # uncomment to debug

# Author : Aurélien DESBRIERES
# Contact: aurelien@hackers.camp
# License: GNU GPL v3 or later


# program to control prerequisites about new machine to add to Nagios
# hostname VS IP
# IP VS hostname
# snmap or wmi ... activated or no
# (if that prerequisites are not activated, then request them to be.

# HOW-TO
# 1st modify the list selector_list
# complete hostname + IP
# 2nd sh requirement_controler.sh
# use | less on big list or free yourself, use GNU Emacs with M-x shell ;-)

# DNS AND HOSTNAME VERIFICATION #< OK
# from hostname to ip
awk '{print $(NF-1);}' selector_list > selector_name
< selector_name xargs -I{} -d'\n' host {} ;
# from ip to hostname
awk '{print $(NF-0);}' selector_list > selector_ip
< selector_ip xargs -I{} -d'\n' host {} ;


# MODULE VERIFICATION
# snmp verification
#< selector_ip xargs -I{} -d'\n' snmpwalk -v2c -c BuzzAero {} | grep IpAddress | grep MIB | head -1
< selector_ip xargs -I{} -d'\n' snmpget -v2c -c BuzzAero {} sysName.0 | grep SNMPv2-MIB::sysName.0 | head -1

# wmi verification
< selector_name xargs -t -I{} -d'\n' /usr/local/nagios/libexec/check_wmi_plus.pl -H {} \
    -A /usr/local/nagios/libexec/sapl.monitoring.cred -m checkcpu | grep denied
