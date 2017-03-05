#!/bin/bash
rsync -aHSvLlKpE --del --force --progress --log-file=rsync.log ~/.* /run/media/<user>/<drive>/BACKUP/
exit 0

# To execute the script via crontab every 5 days
# crontab -e
# 0 0 * * 5 /home/<user>/backup.sh

