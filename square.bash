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

# Getting elements from the users
echo "what is Lenght"
read LENGHT
echo "what is Width"
read WIDTH

# Variable definition
PERIMETER=$((LENGHT*WIDTH))
DESIGN=$(($LENGHT*2))

# Drawing the stuff
printf -v ras %"$DESIGN"s
printf -v res %"$WIDTH"s
printf '%s\n┌'"${ras// /─}┐\n"
printf '%s'"${res// /│${ras/// }│\n}"
printf '%s└'"${ras// /─}┘\n"

# Print the result to the user
printf "Perimeter is: %s\n\n" "$PERIMETER"
