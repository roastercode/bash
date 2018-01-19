#!/bin/bash
# Advanced Bash Scripting
# Complex Functions in BASH
# http://tldp.org/LDP/abs/html/complexfunct.html
# November 2017

dereference () {
    y=\$"$1"
    echo "$y"

    x=$(eval "expr \"$y\" ")
    echo "$1=$x"
    eval "$1=\"Some Different Text \""
}

Junk="Some Text"
echo "$Junk" "before"

dereference Junk
echo "$Junk""after"

exit 0
