FROM debian:latest

RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf

COPY ./tools/nginx.sh /www/nginx.sh

RUN chmod +x /www/nginx.sh

ENTRYPOINT [ "/www/nginx.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]