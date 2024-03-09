FROM debian:oldstable-slim

RUN apt-get update
RUN apt-get install -y redis-server

EXPOSE 6379

WORKDIR /var/

COPY ./tools/redis.sh .

RUN chmod +x ./redis.sh

ENTRYPOINT [ "./redis.sh" ]

CMD [ "redis-server", "--protected-mode no" ]