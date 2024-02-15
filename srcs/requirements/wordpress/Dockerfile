FROM debian:latest

RUN apt-get update && apt-get install -y php-fpm php-mysql sendmail wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wordpress.sh /var/wordpress.sh

EXPOSE 9000

RUN chmod +x /var/wordpress.sh

ENTRYPOINT [ "sh", "/var/wordpress.sh" ]

# The Dockerfile for the wordpress container is similar to the mariadb container.