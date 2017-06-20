#!/bin/bash
# Author : Aurélien DESBRIERES
# Contact: aurelien@hackers.camp
# License: GNU GPL v3 or later

ping-issue(){
    echo "Please check the server $i on PRIORITY" | mail -s "Server $i NOT reachable"  aurelien@hackers.camp
}

server-reboot(){
    echo "Please check the server $i on PRIORITY" | mail -s "Server $i is REBOOTED"  aurelien@hackers.camp
}

for i in $(cat /root/sh/repository/scripts/list_linux)
do
    ping -c 2 $i
    if [ $? -ne 0 ]
    then
	ping-issue
    else
	ssh $i 'uptime | grep "up [0-5][0-9] min,"'
	if [ $? -eq 0 ]
	then
	    server-reboot
	fi
    fi
done
