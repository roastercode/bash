#!/bin/bash
# A shell script that mix + * and / operators

echo "Give me a number please"
read number1
echo "Give me another number please"
read number2
echo "Give me another number please"
read number3
echo "Give me another number please"
read number4
printf "Result: %.10f\n" $(bc -l <<< "$number1 * ($number2 + $number3) / $number4")

# End of program
exit 0
