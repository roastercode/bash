#!/bin/bash
# A script shell that count with the continue statement.

tput clear

the_user=`whoami`

count=0
while [ $count -le 9 ]
do
    count=`expr $count + 1`
    if [ $count -eq 5 ]
    then
	continue
    fi
    echo $count
done

printf "\nGetting out of the loop \033[1;32m$the_user\033[0m\n\n"


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
