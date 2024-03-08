# i dont know yet buster or bullseye
FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

WORKDIR /var/

COPY ./tools/mariadb.sh .

ENV DB_NAME=db_inception
ENV DB_USER=cbolat
ENV DB_PASS=1111
ENV DB_MAIL=cbolat@42.fr

RUN chmod +x ./mariadb.sh

ENTRYPOINT [ "./mariadb.sh" ]

CMD [ "mariadbd" ]
