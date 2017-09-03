#!/bin/bash
# Adjust asus laptop brightness
# License: GPL v2 or later
# Author: Aurélien DESBRIÈRES
# mail: aurelien(at)hackers(dot)camp

# adjustment:
# chown user:root /sys/class/backlight/intel_backlight/brightness
# cp light.sh /usr/bin/light
# chmod +x /usr/bin/light


# light 1 light 2 ...


while true; do
    case $1234567890 in

	# Minimal brightness
	[0]* )  echo 10 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# brightness
	[1]* )  echo 20 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[2]* )  echo 30 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[3]* )  echo 40 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[4]* )  echo 50 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[5]* )  echo 60 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[6]* )  echo 70 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[7]* )  echo 80 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[8]* )  echo 90 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[9]* )  echo 100 > /sys/class/backlight/intel_backlight/brightness
		break;;

	# Minimal brightness
	[]* )  echo 30 > /sys/class/backlight/intel_backlight/brightness
		break;;
    esac
done
