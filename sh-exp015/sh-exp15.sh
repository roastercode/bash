#!/bin/bash
# A shell script with if fi and verify the value of what you type

tput clear

echo "Give me a number please"
read num0
if [[ ! $num0 || $num0 = *[^0-9-.]* ]]; then
    echo "Error, you do not write a number" >&2
    exit 0
fi
echo "Give me another number please"
read num1
if [[ ! $num1 || $num1 = *[^0-9-.]* ]]; then
    echo "Error, you do not write a number" >&2
    exit 0
fi
printf "Result:\033[1m\n%.10f\n\033[0m" $(bc -l <<< "$num0 / $num1")
# End of program
exit 0
