#!/bin/sh

# Create the directory for WordPress
mkdir -p /var/www/html

# Add the FTP_USER, change his password, and declare him as the owner of the WordPress folder and all subfolders
adduser --disabled-password --gecos "" $FTP_USR
chown -R $FTP_USR:$FTP_USR /var/www/html
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

echo "FTP started on :21"
vsftpd /etc/vsftpd.conf
