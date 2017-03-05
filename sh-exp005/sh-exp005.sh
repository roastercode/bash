#!/bin/bash
# Create a file an write in it

echo "Write a file name"
read name
touch $name
echo "Writing in the file..." >> $name
cat $name

# End of the program
exit 0
