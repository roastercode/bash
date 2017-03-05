#!/bin/bash
# A shell script that

tput clear

echo "Verify if a file already exist in your home directory, type a name: "
read name0
if [ -f ~/$name0 ]    # check if the file exist or not in the home directory
   echo "type a name to create the file in your home directory:"
   read name1
   touch ~/$name1
then
    echo "Type somethings you want to write in that file:"
    read sentence
    echo "$sentence" >> ~/$name1
    echo "Here is what the file ~/$name1 contain:"
    cat ~/$name1
fi


# End of program
exit 0
