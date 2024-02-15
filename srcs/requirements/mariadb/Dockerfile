FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /var/

RUN chmod +x /var/mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/var/mariadb.sh"]
