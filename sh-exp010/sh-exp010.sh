#!/bin/bash
# A shell script that make some arithmetic operations with 10 precision

echo "Give me a number please"
read number1
echo "Give me another number please"
read number2
printf "%.10f\n" $(bc -l <<< "($number1 / $number2)")

# End of the program
exit 0
