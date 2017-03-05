#!/bin/bash
# A script shell that give back to the user some sensor informations

tput clear

the_user=`whoami`

printf "\nVoici ton niveau d'usage de ram et de température \033[1;32m$the_user\033[0m\n\n"


printf "\t" ; echo "RAM ---total-------used---------free------shared--buff/cache---available----"
free -mt | grep Mem | tee -a memory.txt
printf "\t" ; echo "Temperature  ---------------------------------------------------------------"
sensors | grep Core | grep 0: | grep °C | tee -a temp.txt

printf "\n\n"

# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
