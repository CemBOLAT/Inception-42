#!/bin/bash

service mariadb start

sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "SHUTDOWN;"

exec "$@"