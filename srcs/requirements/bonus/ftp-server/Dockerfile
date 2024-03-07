FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get clean
RUN apt-get install -y vsftpd

EXPOSE 21

WORKDIR /var/

ENV FTP_USER=ftpuser
ENV FTP_PASS=ftppass

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp.sh .

RUN chmod +x ftp.sh

ENTRYPOINT [ "./ftp.sh" ]

