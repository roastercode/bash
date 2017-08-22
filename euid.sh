#!/bin/bash
# Author  : Aurélien DESBRIÈRES
# Email   : aurelien(at)hackers(dot)camp
# License : GPL V3 or later
# Object  : ID tester

err()
{
    echo >&2 "$(tput bold; tput setaf 1)""[-] ERROR: ${*}""$(tput sgr0)"
    exit 1337
}

if [ $EUID -ne 0 ] ; then
    err "you must be root"
fi
