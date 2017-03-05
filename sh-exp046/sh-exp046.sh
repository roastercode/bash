#!/bin/bash
# A script shell that verify continuously the user login improved version.

tput clear

echo "Enter username:"
read logname

grep "$logname" /etc/passwd > /dev/null
if [ $? -eq 0 ]
then
    echo "Wait ..."
else
    echo "User not found."
fi


time=0

while true
do
    who | grep "$logname" > /dev/null
    if [ $? -eq 0 ]
    then
	echo "$logname has logged in."
	if [ $time -ne 0 ]
	then
	    if [ $time -gt 60 ]
	    then
		min=`expr $time / 60`
		sec=`expr $time % 60`
		echo "$logname was $min minutes and $sec seconds late in logging in."
	    else
		sec=$time
		echo "$logname was $sec seconds late in logging in."
	    fi
	fi
	exit
    else
	time=`expr $time + 1`
	sleep 60
    fi
done

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
