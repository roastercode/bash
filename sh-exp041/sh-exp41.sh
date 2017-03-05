#!/bin/bash
# A script shell that load a loop and stop another one during process using break


tput clear

the_user=`whoami`

printf "\nLaunching the loop to from 0 to 10 $the_user!\n"
count=0
while [ $count -le 10 ]
do
    echo $count
    count=`expr $count + 1`
done

echo "You are out of the loop!"

sleep 1

printf "\nNow lets break the loop at 5\n"

sleep 2


count=0

while [ $count -le 10 ]
do
    if [ $count -eq 6 ]
    then
	break
    fi
    
    printf "\t\033[0;35m$count\033[0m\n" # giving a bit of color in the output and space
    count=`expr $count + 1`
done


printf "\nWell done $the_user!\n\n"

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
