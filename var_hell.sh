#!/bin/bash
# function and parameters

DEFAULT=default

func2 () {
    if [ -z "$1" ]
    then
	echo "-Parameter #1 is zero lenght.-"
    else
	echo "-Parameter #1 is \"$1\".-"
    fi
    variable=${1-$DEFAULT}
    echo "Variable = $variable"

    if [ "$2" ]
    then
	echo "-Parameter #2 is \"$2\".-"
    fi

    return 0
}

echo

echo "Nothing passed."
func2                          # Called with no params
echo

echo "Zero-length parameter passed."
func2 ""                       # Called with zero-length param
echo

echo "Null parameter passed."
func2 "$uninitialized_param"   # Called with uninitialized param
echo

echo "One parameters passed."
func2 first                    # Called with one params
echo

echo "Two parameters passed."
func2 first second             # Called with two params

echo "\"\" \"second\" passed."
func2 "" second                # Called with zero-length first parameter
echo                           # and ASCII string as a second one.


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


exit 0
