#!/usr/bin/env BASH
#set -x
# 0 create second list
# 1 read the first list
# 2 host each hostname from first list get IP and write IP to IP colomn of second list
# 3 host each IP from first list get HOSTNAME and write HOSTNAME to HOSTNAME colomn of second list
# 4 diff, sort first list to second list and generate the change


# Replace selector0 to be a file read from read -p
#read selector_list
#sed -i "s/selecot_list/$selector_list/g"


# DNS AND HOSTNAME VERIFICATION #< OK
# from hostname to ip
awk '{print $(NF-1);}' selector_list > selector_name
< selector_name xargs -I{} -d'\n' host {}
# from ip to hostname
awk '{print $(NF-0);}' selector_list > selector_ip
< selector_ip xargs -I{} -d'\n' host {}


# MODULE VERIFICATION
# snmp verification
< selector_ip xargs -I{} -d'\n' snmpwalk -v2c -c ZodiacAero {} > snmp_analysis
cat snmp_analysis|grep Timeout
# wmi verification
< selector_name xargs -I{} -d'\n' /usr/local/nagios/libexec/check_wmi_plus.pl -H {} -A /usr/local/nagios/libexec/sapl.monitoring.cred -m checkcpu
