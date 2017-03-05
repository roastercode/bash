#!/bin/bash
# A shell script that verify if a file/folder exist in the home folder

tput clear

echo "Verify if a file already exist in your home directory, type a name: "
read name0
if [ -f ~/$name0 ]    # check if the file exist or not in the home directory
                     # 
then
    echo "Correct!"
else
    echo "That is not a correct file name"
fi

# End of program
exit 0
