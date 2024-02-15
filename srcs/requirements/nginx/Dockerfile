FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/

COPY ./tools/nginx.sh /

RUN chmod +x /nginx.sh

ENTRYPOINT [ "/nginx.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]