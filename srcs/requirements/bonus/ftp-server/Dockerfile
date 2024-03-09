FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get clean
RUN apt-get install -y vsftpd

EXPOSE 21

COPY ./tools/ftp-server.sh /

RUN chmod +x ./ftp-server.sh

ENTRYPOINT [ "./ftp-server.sh" ]

CMD [ "vsftpd", "/etc/vsftpd.conf" ]
