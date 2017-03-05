#!/bin/bash
# GNU GPL v2 or later
# Aurélien DESBRIÈRES <aurelien@hackers.camp>
# Fullscreen for Fedora 25 in virtualbox after kernel update

sudo su -
mount -r /dev/cdrom /media/VirtualBoxGuestAdditions/
KERN_DIR=/usr/src/kernels/`uname -r`
export KERN_DIR
cd /media/VirtualBoxGuestAdditions/
./VBoxLinuxAdditions.run
reboot
