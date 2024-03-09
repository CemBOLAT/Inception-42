#!/bin/bash

# Start vsftpd
service vsftpd start

# Add the USER if it doesn't exist
if ! id "$FTP_USER" &>/dev/null; then
    adduser --disabled-password --gecos "" $FTP_USER
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
fi

# Set up directories if they don't exist
if [ ! -d "/home/$FTP_USER/ftp" ]; then
    mkdir /home/$FTP_USER/ftp
    chown nobody:nogroup /home/$FTP_USER/ftp
    chmod a-w /home/$FTP_USER/ftp
fi

if [ ! -d "/home/$FTP_USER/ftp/files" ]; then
    mkdir /home/$FTP_USER/ftp/files
    chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files
fi

# Modify vsftpd configuration
sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf
echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$FTP_USER/ftp
pasv_min_port=5000
pasv_max_port=5010
userlist_file=/etc/vsftpd.userlist" >>/etc/vsftpd.conf

if ! service vsftpd status >/dev/null; then
    echo "vsftpd service is not running. Starting..."
    exec "$@"
else
    echo "vsftpd service is already running."
    exec "$@"
fi
