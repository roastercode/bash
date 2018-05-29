#!/usr/bin/env BASH

today=$(date -d $(echo $d|awk -F- '{print $3 "-" $1 "-" $2}') +%A)


if [ "$today" == "Thursday" ] ; then
    ping -c 4 gnu.org ; exit
fi
