#!/bin/bash
# A script shell that use IFS (Internal Field Separator)
# More info at https://en.wikipedia.org/wiki/Internal_field_separator
# http://www.tldp.org/LDP/abs/html/internalvariables.html

tput clear

the_user=`whoami`

line="Shell Scripting is cool!"
IFS=:
# If IFS is use like: IFS=:i it will remove the character and print the things line by line
set $line
echo $1
echo $2
echo $3
echo $4

printf "\nWell done $the_user!\n\n"


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
