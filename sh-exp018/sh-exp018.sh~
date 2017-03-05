#!/bin/bash
# A shell script with if fi then elif else

tput clear

echo "Enter a number between 100 and 200:"
read number
if [ $number -lt 100 ] # comparison operators -eq -ne -gt -ge -lt -le < <= > >= = == !=
                       # http://www.tldp.org/LDP/abs/html/comparison-ops.html
then
    echo "You write a number under 100."
elif [ $number -gt 200 ]
then
    echo "You write a number greater than 200."
else
    echo "correct!"
fi

# End of program
exit 0
