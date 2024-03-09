FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y sendmail
RUN apt-get install -y wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

WORKDIR /var/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/wordpress.sh .

RUN chmod +x ./wordpress.sh

ENTRYPOINT [ "./wordpress.sh" ]

CMD [ "/usr/sbin/php-fpm7.4", "--nodaemonize" ]
