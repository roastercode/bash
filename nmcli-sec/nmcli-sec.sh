#!/bin/bash
# Use nmcli command line with secure envirronement variables

# List wifi avaibable around
nmcli device wifi

# Chose the network
echo -n Select the Network Id:
read  id

# Read Password
echo -n Password:
read -s password

# Run Command
nmcli device wifi connect $id password $password
