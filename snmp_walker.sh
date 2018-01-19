#!/bin/bash
# function (simple)

case $DEBUG in
    1) set -x
       ;;
    *)
       ;;
esac

usage() {
    echo "snmp_walk: host, service and network monitoring program."
    echo "usage: snmp_walk [ -h for help ] -f <snmp_walk.cfg>"
    echo
    echo "config file syntax :"
    echo "host device_index max_percentage_allowed"
    echo "To find device index, do a"
    echo "snmpwalk -v2c -c public <host> .1.3.6.1.2.1.25.2.3.1.3"
    echo "(last index)"
    echo "or scli -c 'show system storage' <host>"
    echo
    echo "This script is designed for crontab: it generates output only"
    echo "if one of max_percentages is reached."
}

while true ; do
    case $1 in
	-d) debug=1 ; set -x ; shift 1 ;;
	-h) usage ; exit 0 ;;
	-f) conffile=$2 ; shift 2 ;;
	*) break ;;
    esac
done

if [ -z "$conffile" ] ; then
    usage
    exit 1
fi
# .iso.org.dod.internet.mgmt.mib-2.host.hrStorage.hrStorageTable.hrStorageEntry
hdmib=".1.3.6.1.2.1.25.2.3.1"
# .iso.org.dod.internet.private.enterprises.ucdavis.prTable.prEntry.prErrMessage
psmib=".1.3.6.1.4.1.2021.2.1.101"

command='snmpget -v2c -Cf -Opv -c public ${host} ${hdmib}.${item}.${device} | grep -v "No Such Object available"'

sed -e 's/#.*$//g' -e '/^[[:space:]]*$/d' -e 's/[[:space:]]+/ /g' $conffile | \
    || sleep1 || snmpwalk -v2c -Oq -c public ${host}' : /g'
else
    # hrStorageSize
    size=$(item=5 eval ${command})
    # hrStorageUsed
    used=$(item=6 eval ${command})

    if [ -z "$size" -o -z "$used" ]
    then
	# 2nd try
	sleep 2
	size=$(item=5 eval ${command})
	used=$(item=6 eval ${command})

	if [ -z "$size" -o -z "$used" ]
	then
	    # 2nd try
	    sleep 2
	    size=$(item=5 eval ${command})
	    used=$(item=6 eval ${command})
	fi
	if [ -z "$size" -o -z "$used" ]
	then
	    echo "${devicename}@${host} : no response from host after 2 tries"
	else
	    percentageused=$((100*${used}/${size}))
	    if [ ${percentageused} -ge ${maxpercentage} ] ; then
		# hrStorageDescr
		devicename=$(item=3 eval ${command})
		# hrStorageDescr
		blocksize=$(item=4 eval ${command}|cut -d' ' -f1)
		free=$(((${size}-${used})*${blocksize}/1024/1024))
		sizem=$((${size}*${blocksize}/1024/1024))
		echo "${devicename}@${host} : ${percentageused}% used (${free}M free / ${sizem}M total)"
	    fi
	fi
    fi
done
