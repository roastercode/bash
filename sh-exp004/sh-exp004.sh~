#!/bin/bash
#using touch mv echo read ls banner

# Request the name of a file
echo "Enter the name of a file"
read file_name

# Create the file
touch $file_name

# Rename the file
mv $file_name $file_name.extra
echo "The file has been be renamed as" $file_name.extra

# Read the file and display the directory
cat $file_name.extra
ls -la

# Print that the file have been be created with its name
banner $file_name.extra "Created!"

# End of the program
exit 0
