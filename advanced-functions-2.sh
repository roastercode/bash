#!/bin/bash
# Advanced Bash Scripting
# Complex Functions in BASH
# http://tldp.org/LDP/abs/html/complexfunct.html
# November 2017
func ()

{
    echo "$1"
}

echo "First call to function: no arg passed."
echo "See if command-line arg is seen."
func
# No! Command-line arg not seen.

echo "========================================"
echo
echo "Second call to function: command-line arg passed explicitly."
func "$1"
# Now it's seen!

exit 0
