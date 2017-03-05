#!/bin/bash
# A counter shell script with until do echo done

tput clear

the_user=`whoami` # backtrick creating the $the_user to the command whoami to get the username

count=0
until [ $count -ge 10 ] # [] is a task condition
do
    echo $count
    count=`expr $count + 1`
done


# End of program
exit 0

# exit $? to exit the program on last command
# exit 0 to exit the program
