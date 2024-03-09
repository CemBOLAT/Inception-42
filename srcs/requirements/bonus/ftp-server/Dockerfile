FROM alpine:3.17

RUN apk -U upgrade && apk add vsftpd shadow

COPY tool/ftp-server.sh /etc/.
COPY conf/vsftpd.conf /etc/vsftpd/.

ENTRYPOINT ["sh", "/etc/ftp-server.sh"]