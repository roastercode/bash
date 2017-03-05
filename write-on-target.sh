#!/usr/bin/bash
FILE=servers_list

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
