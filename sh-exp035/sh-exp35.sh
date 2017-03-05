#!/bin/bash
# A script shell extracting information from a file

echo "Enter a username"
read logname
line=`grep $logname /etc/passwd`
IFS=:
set $line
echo "username:$1"
echo "password:$2"
echo "user ID:$3"
echo "group id:$4"
echo "comment field:$5"
echo "home folder:$6"
echo "default shell:$7"

printf "\nWell done $1!\n\n"


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
