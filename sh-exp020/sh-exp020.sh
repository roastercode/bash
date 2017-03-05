#!/bin/bash
# A shell script that

tput clear

echo "Verify if a file already exist in your home directory, type a name: "
read name0
if [ -f ~/$name0 ] # check if the file exist or not in the home directory
then
    if [ -w ~/$name0 ]
    then
	echo "The file is writable!"
	echo "type somethings you want to write in that file:"
	read sentence
	echo "$sentence" >> ~/$name0
	echo "Here is what the file ~/$name0 contain:"
	cat ~/$name0
    else
	echo "This file is not writable, bye!"
    fi
fi

# End of program
exit 0
