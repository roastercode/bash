#!/bin/bash
# A script shell with for loop that list all directory from the current execution place

tput clear

the_user=`whoami`

for item in ../*
do
    if [ -d $item ]
    then
	echo $item
    fi
done

echo "Well done $the_user!"


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
