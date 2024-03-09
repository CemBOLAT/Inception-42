# i dont know yet buster or bullseye 
FROM debian:oldstable-slim

RUN apt-get update && apt-get install -y apt-utils && \
    apt-get install -y libterm-readline-gnu-perl && \
    apt-get install -y mariadb-server libterm-readline-perl-perl

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /var/

RUN chmod +x /var/mariadb.sh

ENTRYPOINT [ "/var/mariadb.sh" ]

CMD [ "mariadbd" ]