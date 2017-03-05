#!/bin/bash
# A shell script that increment from 0 to 20 and decrement from 20 to 0 while - do - done loop

tput clear

the_user=`whoami` # backtrick creating the $the_user to the command whoami to get the username

count=0
while [ $count -le 20 ]     # as long as the number 20 will not be reach the script will continu
do
    echo $count
    count=`expr $count + 1`
done

echo "Well done $the_user"

count=20
while [ $count -ne -1 ]    # as long as the number 0 will not be reach the script will continu
do
    echo $count
    count=`expr $count - 1`
done

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
