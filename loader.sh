#!/bin/bash
# Parallel Script Loader

# Copyright (C) 2016 Aurélien DESBRIÈRES <aurelien@hackers.camp> 

# INFORMATION
# Load that script from /tools/admin/pulp/
# Send the script on remote target
for target in $(cat hostfile) ; do
    scp /tools/admin/pulp/file.sh "$target":~/
done


# Execute the script on remote target
mussh -a -i ~/.ssh/id_rsa.pub -d -H hostfile -C 'file.sh' -m2
