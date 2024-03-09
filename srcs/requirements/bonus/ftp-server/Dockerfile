FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get clean
RUN apt-get install -y vsftpd

EXPOSE 21

ENV FTP_USER=elbolat
ENV FTP_PASS=ftppass

COPY ./tools/ftp-server.sh /

RUN chmod +x ./ftp-server.sh

ENTRYPOINT [ "./ftp-server.sh" ]

CMD ["tail", "-f", "/dev/null"]
