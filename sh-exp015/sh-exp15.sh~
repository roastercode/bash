#!/bin/bash
# A shell script that include tput (this one to clear the terminal on loading)

tput clear
echo "Give me a number please"
read number0
echo "Give me another number please"
read number1

printf "Result:\033[1m\n%.10f\n\033[0m" $(bc -l <<< "$number0 / $number1")

# End of program
exit 0
