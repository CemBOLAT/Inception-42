FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl

EXPOSE 443

ENV DOMAIN_NAME=cbolat.42.fr
ENV CERTIFICICATES_OUT=/etc/ssl/certs/inception.crt
ENV CERTIFICICATES_KEYOUT=/etc/ssl/private/inception.key

WORKDIR /var

COPY ./conf/default /etc/nginx/sites-enabled/

COPY ./tools/nginx.sh .

RUN chmod +x ./nginx.sh

ENTRYPOINT [ "./nginx.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]
