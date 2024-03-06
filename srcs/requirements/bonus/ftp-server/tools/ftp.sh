#!/bin/bash

# This script is used to start the ftp server

echo $DB_USER | tee  -a /etc/vsftpd/vsftpd.userlist
# Start the ftp server
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
