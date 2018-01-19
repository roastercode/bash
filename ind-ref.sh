#!/bin/bash
var=23

echo "\$var =$var"     #$var   =23

echo "\$\$ expanded to PID of the script
-- refer to the entry as plain text.

echo "\\\$\$var = \$$var"     # \$$var = $23

a=letter_of_alphabet   # variable "a" holds the name of another variable.
letter_of_alphabet=z

echo

echo "a = $a"         # a = letter_of_alphabet

eval "a=\$$a

echo "Now a = $a"     # Now a = z

echo

# Now, let's try changing the second-order reference

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "Changing value of \"table_cell_3\" to $NEW_VAL."
echo -n "dereferenced \"t\" now "; eval echo \$$t
# "eval" takes the two arguments "echo" and "\$$t" (set equal to $table_cell_3)

echo
exit 0
