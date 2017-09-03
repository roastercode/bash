#!/bin/bash
# author: Aurélien DESBRIÈRES <aurelien(at)hackers(dot)camp
# license: GPL v2 or later

# Use nmcli command line with secure envirronement variables
tput clear

# List wifi avaibable around
nmcli device wifi

# Chose the network
echo -n Select the Network Id:
read id

# Read Password
echo -n Password:
read -s password

# Run Command
nmcli device wifi connect $id password $password

exit 0
