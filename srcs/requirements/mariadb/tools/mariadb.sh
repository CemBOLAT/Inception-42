#!/bin/bash

service mariadb start

sleep 2

mysqld -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;"
mysqld -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysqld -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysqld -e "FLUSH PRIVILEGES;"
mysqld -e "SHUTDOWN;"

exec "$@"