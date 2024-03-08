#!/bin/bash

chown -R www-data:www-data /var/www/*;
chmod -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
    mkdir -p /var/www/html;
    cd /var/www/html;

    wp core download --allow-root;

    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost=mariadb;

    echo "WordPress installation has started. Wait until the installation is completed."

    wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title=$TITLE \
        --admin_user=$ADMIN_NAME \
        --admin_password=$ADMIN_PASS \
        --admin_email=$ADMIN_MAIL;

    wp user create --allow-root \
        $DB_USER $DB_MAIL \
        --user_pass=$DB_PASS;
fi

echo "You can visit $DOMAIN_NAME in your browser."

exec "$@"