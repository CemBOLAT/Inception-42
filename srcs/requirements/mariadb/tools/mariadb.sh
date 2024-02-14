#!/bin/bash

# Güvenli kurulum yapma
#DB_NAME=inception
#DB_USER=cbolat
#DB_PASS=123456

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
#mysql -e "quit;"


