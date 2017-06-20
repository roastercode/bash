#!/bin/sh

while ! ping -c1 $1 &>/dev/null
do echo "Ping Fail - `date`"
done
echo "Host Found - `date`"
/root/scripts/test1.sh

nohup ./networktest.sh HOSTNAME > /tmp/networktest.out 2>&1 &
