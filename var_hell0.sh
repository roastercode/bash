#!/bin/bash
# function and parameters

func1() {
    echo This is a function
}

declare -f        # List the function above

echo

declare -i var1   # var1 is an integer
var1=2367
echo "var1 declared as $var1"
var1="var1+1 incremented by 1 is $var1."
# Attempt to change variable declared as integer.
echo "Attempting to change var1 to floating point value, 2367.1."
var1=2367.1       # Results in error message, with no change to variable.
echo "var1 is still $var1"

echo

declare -r var2=13.36

echo "var2 declared as $var2"
var2=13.37
exit 0
