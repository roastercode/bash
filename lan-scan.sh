#!/usr/bin/bash
# LAN Scanner is made to scan and list in realtime the LAN
# AUTHOR : Aurelien DESBRIERES
# aurelien@hackers.camp
# please send me bug report!

# Variables
FILE=/home/adesbrie/codes/test_host
HOSTNAME="$(hostname)"
FILE=servers_list
PID0=nmap -v -Pn -O --osscan-guess 10.127.201.0/24 | grep -v "host down" | tee -a /var/log/is/host-down.log

# Clear the terminal on load
tput clear

# Welcome part
printf "%s\nWelcome to Infra Scanner\n"
printf "%s\nThis tool will create full reports of your host down\n"
printf "%s\n+ a complete list of your linux type of running machine\n"
printf "%s\nPlease have a look at the end in your /var/log/is/\n"

# Processing first scan part
printf "%s\nProcessing analysis of down host\n"
PID0=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID0 ]
do
    printf "\b${sp:i++%${#sp}:1}"
done

printf "%s\nHost Down list completed\n"
printf "%s\nPlease have a look to you /var/log/is/host-down.log\n"

nmap -v -Pn -O --osscan-guess 10.127.201.0/24 | grep "Nmap scan report"

for host in `cat $FILE | grep -v "^#" | awk '{print $1}'`
do
    # send the files to each host
    scp -r ~/directory_and_files $host:/tmp/
    # Create a backup directory and save by renaming them and move them to backup
    # Modify proxy services and do all sort of action on the remote target
    ssh -T $host <<EOF
sudo su -;
mkdir -p /home/user/backup;
mv /home/user/[^backup]* /home/user/backup/;
echo 'no_proxy="services.proxy.com" >> /etc/profile';
exit;
sudo su -;
cp /etc/profile /home/user/backup/;
pkill -9 pacman;
pacman -Syu;
EOF
done
