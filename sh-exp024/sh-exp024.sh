#!/bin/bash
# A shell script that evaluate and send back the evaluation with the name of the terminal user
# if else then fi echo read evaluation -le -ge + and operator -a + ``backtrick substitution command


tput clear

echo "Enter a character"
read var
if [ `echo $var | wc -c` -eq 2 ] # wc receive input in text form
# input: echo var -> output: wc -c (pipe send the value to wc to return the number of characters
# -eq 2 compare the numerique value of the  `backtick `
then
    correct_man=`whoami` # a simple echo "correct" make the trick, but that is to play
    #with the `` backtrick that offer the way to call a command
    echo "You are right $correct_man!"
else
    incorrect_man=`whoami`
    echo "You are wrong $incorrect_man!"
fi


# End of program
exit 0
