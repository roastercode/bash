cat << EOF > /etc/backup-manager.sh && chmod 700 /etc/backup-manager.sh
#!/bin/sh
test -x /usr/sbin/backup-manager || exit 0
/usr/sbin/backup-manager
EOF
