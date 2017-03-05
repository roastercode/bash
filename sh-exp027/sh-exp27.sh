#!/bin/bash
# A shell script that request for vowel and whatever using [] and -o control (optname) bash builtin

tput clear

the_user=`whoami` # backtrick creating the $the_user to the command whoami to get the username

echo "Enter one lowercase vowel"
read var
if [ `echo $var | wc -c` -eq 2 ]
then
    if [[ $var == *[AEIOUYaeiouy]* ]]
    then
	echo "You enter the vowel '$var' $the_user!"
    else
	echo "You enter '$var', that is not a vowel $the_user!"
    fi
else
    echo "You are wrong $the_user! I request you to enter one lowercase vowel, not '$var'."
fi
echo "Enter what whatever you want $the_user"
read whatever
echo "You entered: $whatever $the_user"


# End of program
exit $? # exit $? to exit the program on last command
        # exit 0 to exit the program
