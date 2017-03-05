#!/bin/bash
# File size

FILE_SIZE=$"du -h"
# Clear the terminal
tput clear

# Request the user where and which file with an example
printf "Which file do you wish to calculate?\n"
printf "Please provide its place and name like /home/user/file-size.sh\n"
read FILE

# Calculate with du -h (human readable) and print the output
$FILE_SIZE $FILE
