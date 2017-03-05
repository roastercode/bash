#!/bin/bash
#using touch mv echo read ls banner

# Request informations for the timer
echo set the timer please
echo set the hour
read hour
echo set the minutes
read minutes

var="$hour $minutes * * 0-6 env DISPLAY=:0.0 /usr/bin/cvlc /home/aurelien/Music/space-oddity.mp4";
destdir=/home/aurelien/crontab.tempus

if [ -f "$destdir" ]
then
    echo $var > $destdir
fi

echo The timer have been set at $hour $minutes

# End of the program
exit 0
