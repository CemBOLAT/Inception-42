# i dont know yet buster or bullseye 
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /var/

RUN chmod +x /var/mariadb.sh

ENTRYPOINT [ "/var/mariadb.sh" ]

CMD [ "mariadbd" ]