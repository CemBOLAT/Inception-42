FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get clean
RUN apt-get install -y vsftpd

EXPOSE 21

COPY ./tools/ftp-server.sh /

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x ./ftp-server.sh

ENTRYPOINT [ "./ftp-server.sh" ]

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd.conf" ]
