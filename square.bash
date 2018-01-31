#!/bin/bash
# Author : Aurélien DESBRIERES
# Contact: aurelien@hackers.camp
# License: GNU GPL v3 or later

# Square draw & Perimeter calculus with its algorithm

# REQUEST : L
# SAVE L AS A DATA
# REQUEST : l
# SAVE L AS A DATA
# PRINT L LINE
# IMPROVE DESIGN BY X2 the Lenght
# PRINT l LINE WITH THE SPACE OF L-2
# PRINT L LINE TO CLOSE THE SQUARE/RECTANGLE
# USE L AND l TO CALCULATE PERIMETER
# PRINT PERIMETER BELOW THE SQUARE/RECTANGLE

echo "what is Lenght"
read LENGHT
echo "what is Width"
read WIDTH
PERIMETER=$((LENGHT*WIDTH))
DESIGN=$(($LENGHT*2))
printf -v ras %"$DESIGN"s
printf -v res %"$WIDTH"s

printf '%s\n┌'"${ras// /─}┐\n"
printf '%s'"${res// /│${ras/// }│\n}"
printf '%s└'"${ras// /─}┘\n"

printf "Perimeter is: %s\n" "$PERIMETER"
