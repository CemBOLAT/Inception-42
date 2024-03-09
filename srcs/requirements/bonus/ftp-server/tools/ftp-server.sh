#!/bin/bash

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

exec "$@"