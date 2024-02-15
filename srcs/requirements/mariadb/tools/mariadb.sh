#!/bin/bash

service mariadb start

sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQL_ROOT_PASSWORD;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_ROOT_PASSWORD.* TO '$MYSQL_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "SHUTDOWN;"

exec "$@"