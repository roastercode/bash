#!/bin/bash
# Clean, Backup & Sync to keep the configuration alive!
# Author: Aurélien DESBRIÈRES
# Contact: aurelien(at)hackers(dot)camp
# License: GPL V3 or later

# Register the user identification during process
#printf "\033[1;32m%s\nRegistering your identification during the MAAS process\033[0m%s\n"
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval "$(ssh-agent)"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

# correct and reload gpg agent
#echo pinentry-program /usr/bin/pinentry-curses >> ~/.gnupg/gpg-agent.conf
#echo RELOADAGENT | gpg-connect-agent

# Clean all old modified stuff
rm -rf ~/.*~

# Create the directory
mkdir -p ~/backsync

# Copy the stuff to the backup directory
cp ~/.bash_profile ~/backsync/
cp ~/.bashrc ~/backsync/
cp ~/.emacs ~/backsync/
cp ~/*.md ~/backsync/
cp -r ~/.ssh/ ~/backsync/
cp -r ~/.gnupg/ ~/backsync/
cp -r ~/.w3m/ ~/backsync/
cp ~/.vimrc ~/backsync/

# Compress the stuff
tar czvf ~/backsync.tar.gz ~/backsync/

# Encrypt the stuff before sending
gpg -c ~/backsync.tar.gz

# Clean the directory
rm -rf ~/backsync
rm -rf ~/backsync.tar.gz

# Send the backuped stuff to remote area
scp -r ~/backsync.tar.gz.gpg icecloud:~/
scp -r ~/backsync.tar.gz.gpg icebreaker:~/
scp -r ~/backsync.tar.gz.gpg subair:~/

# Clean the local encrypted backup file
rm -rf ~/backsync.tar.gz.gpg
