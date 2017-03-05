#!/usr/bin/bash

FILE=host_list

for host in `cat $FILE | grep -v "^#" | awk '{print $1}'`
do
    echo $host
    ssh -n $host 'sudo yum list installed samba 2>&1' | awk -v "h=$host" '{print h": "$0}'
done

