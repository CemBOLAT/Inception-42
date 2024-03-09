FROM debian:oldstable-slim

RUN apt update -y && \
    apt install -y nodejs npm && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools /home/app

WORKDIR /home/app

RUN npm init -y && \
    npm install express

ENTRYPOINT ["node"]

CMD ["app.js"]

