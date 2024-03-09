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

    # Redis cache
    #wp config set WP_REDIS_HOST redis --allow-root
    #wp config set WP_REDIS_PORT 6379 --raw --allow-root
    #wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
    #wp config set WP_REDIS_CLIENT phpredis --allow-root
    #wp plugin install redis-cache --activate --allow-root
    #wp plugin update --all --allow-root
    #wp redis enable --allow-root
fi

echo "You can visit $DOMAIN_NAME in your browser."

exec "$@"
