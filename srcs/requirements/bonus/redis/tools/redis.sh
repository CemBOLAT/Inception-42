#!/bin/bash

sed -i 's/daemonize yes/daemonize no/' /etc/redis/redis.conf
sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/' /etc/redis/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

echo 'vm.overcommit_memory=1' >> /etc/sysctl.conf

# Remounting the file system as read-write
mount -o remount,rw /sys/kernel/mm/transparent_hugepage

# Writing to the enabled file
echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled

# Adding the command to /etc/rc.local
echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local

redis-server --protected-mode no
