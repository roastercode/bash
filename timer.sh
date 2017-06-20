#!/bin/bash
TIMER='date | awk '\''{print$4}'\'' | figlet -S'
watch -n 0.1 $TIMER
