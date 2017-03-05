#!/bin/bash
# A script shell that count word and sentence in a file - using special bash variable $#

tput clear

the_user=`whoami`

echo "Enter a filename:"
read fname

terminal=`tty`

exec < $fname

nol=0 # number of lines
now=0 # number of words

while read line
do
    nol=`expr $nol + 1`  # use `` for the mathematical expression that increment the value on the loop execution
    set $line            # set position parameter
    now=`expr $now + $#` # evaluate value by $# system variable - bash variable substitution
                         # $# Expands to the number of positional parameters in decimal.
done

echo "Number of line: $nol"
echo "Number of words: $now"

exec < $terminal


printf "\nWell done $the_user!\n\n"

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
