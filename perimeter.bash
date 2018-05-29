#!/bin/bash
# Author : Aurélien DESBRIERES
# Contact: aurelien@hackers.camp
# License: GNU GPL v3 or later

# Perimeter calculus with its algorithm

# VAR       :  L, l
# PERIMETER :  L*l
# RESULT    :  print calculus result

L=3
l=2
p=$((L*l))
printf "Perimeter is: %s\n" "$p"


# REQUEST & SAVE : L
# SAVE L AS A DATA
# REQUEST : l
# SAVE L AS A DATA
# USE L AND l TO CALCULATE PERIMETER
# PRINT PERIMETER

# # # echo "what is L"
# # # read L
# # # echo "what is l"
# # # read l
# # # p=$((L*l))
# # # printf "Perimeter is: %s\n" "$p"


# PERIMETER REQUEST, DRAW & CALCULUS
# REQUEST : L
# SAVE L AS A DATA
# REQUEST : l
# SAVE L AS A DATA
# PRINT L LINE
# PRINT l LINE WITH THE SPACE OF L-2
# PRINT L LINE TO CLOSE THE SQUARE/RECTANGLE
# USE L AND l TO CALCULATE PERIMETER
# PRINT PERIMETER BELOW THE SQUARE/RECTANGLE

echo "what is Lenght"
read Lenght
echo "what is Width"
read Width
Perimeter=$((Lenght*Width))
printf -v ras %"$Lenght"s
printf -v res %"$Width"s

printf '%s\n┌'"${ras// /─}┐\n"
printf '%s'"${res// /│${ras/// }│\n}"
printf '%s└'"${ras// /─}┘\n"

printf "Perimeter is: %s\n" "$Perimeter"
