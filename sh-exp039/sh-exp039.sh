#!/bin/bash
# A script shell that print man page request from a file to another file
# including /usr/share/man7/* in the command list would create a file with all man page installed on the
# current operating system

tput clear

the_user=`whoami`

for cmd in `cat commandlist` # command requesting to read a file
do
    man $cmd >> helpfile     # loop requesting to create and print () in a file
done

printf "\nWell done $the_user!\n\n"

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
