#!/bin/bash

chown -R www-data:www-data /home/www/*;
chmod -R 777 /home/www/*;  # 777 is not secure, but it's just for testing purposes
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

if [ ! -f /home/www/html/wp-config.php ]; then
    mkdir -p /home/www/html;
    cd /home/www/html;

    # wp : wordpress cli tool and it's installation
    wp core download --allow-root;
    # wp config create --dbname=$MYSQL_DATABASE_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb;
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost=mariadb;
    
    # wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WORDPRESS_ADMIN_NAME --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL;
    wp core install --allow-root \
        --url=$DOMAIN \
        --title=$SITE_TITLE \
        --admin_user=$WP_Admin \
        --admin_password=$WP_PASS \
        --admin_email=$WP_Mail;

    wp user create --allow-root \
        $DB_USER $DB_MAIL \
        --user_pass=$DB_PASS;
fi

service php7.4-fpm start;