#!/bin/bash
# Advanced Bash Scripting
# Complex Functions in BASH
# http://tldp.org/LDP/abs/html/complexfunct.html
# November 2017
ITERATIONS=3
icount=3

my_read(){
    local local_var

    echo -n "Enter a value "
    eval 'echo -n "[$"$1"] "'

    read local_var
    [ -n "$local_var" ] && eval "$1"=\$local_val
}

echo

while [ "$icount" -le "$ITERATIONS" ]
do
    my_read var
    echo "Entry #$icount =$var"
    let "icount += 1"
    echo
done

exit 0
