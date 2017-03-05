#!/bin/bash
# A script shell that verify continuously the user login.

tput clear

the_user=`whoami`

echo "Enter username:"
read logname

time=0

while true
do
    who | grep "$logname" > /dev/null
    if [ $? -eq 0 ]
    then
	echo "$logname has logged in."
	if [ $time -ne 0 ]
	then
	    echo "$logname was $time minutes late in logging in."
	fi
	exit
    else
	time=`expr $time + 1`
	sleep 60
    fi
done


printf "\nGetting out of the loop \033[1;32m$the_user\033[0m\n\n"


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
