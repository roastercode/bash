#!/bin/bash
# Parallel Script Loader
# Copyright (C) 2016 Aurélien DESBRIÈRES <aurelien@hackers.camp>

# INFORMATION
# Load that script from /tools/admin/pulp/

# file.sh is part of loader.sh
# This file execute action on remote target

# Backup old configuration and file
sudo su -;
mkdir -p /etc/yum.repos.d/backup;
mv /etc/yum.repos.d/[^backup]* /etc/yum.repos.d/backup/;
mv /etc/yum.conf /etc/yum.conf.backup;
cp /tools/admin/pulp/yum.conf /etc/.;
mv /etc/yum.conf.distrib /etc/yum.conf.distrib.backup;
cp /tools/admin/pulp/yum.conf.distrib /etc/.;
mv /etc/yum.conf.forcekernelupdate /etc/yum.conf.forcekernelupdate.backup;
cp /tools/admin/pulp/yum.conf.forcekernelupdate /etc/.;
echo 'no_proxy="pulp.cma-cgm.com" >> /etc/profile';
# Add pulp no proxy on live stamp
export no_proxy="pulp.cma-cgm.com";

# Copy pulp repository file and configure yum
cp /tools/admin/pulp/rhel-6.8.repo /etc/yum.repos.d/;
pkill -9 yum;
yum clean all;
yum repolist;
