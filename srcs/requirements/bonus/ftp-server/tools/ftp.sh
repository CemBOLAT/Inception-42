#!/bin/sh

# Create the directory for WordPress
mkdir -p /var/www/html

# Print out the value of FTP_USR for debugging
echo "FTP_USR is set to: $FTP_USR"

# Add the FTP_USER, change his password, and declare him as the owner of the WordPress folder and all subfolders
adduser $FTP_USR --disabled-password 2>&1 | tee /tmp/adduser_output.log
chown -R $FTP_USR:$FTP_USR /var/www/html
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

vsftpd /etc/vsftpd.conf
