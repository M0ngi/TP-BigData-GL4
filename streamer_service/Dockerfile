FROM python:alpine3.16

RUN apk update
RUN apk upgrade
RUN apk add build-base
RUN apk add socat

RUN apk add --no-cache \
    gcc \
    g++ \
    musl-dev \
    librdkafka \
    librdkafka-dev

RUN  pip install requests confluent-kafka==1.3.0

WORKDIR /app

COPY stream.py .

CMD socat TCP-LISTEN:1337,reuseaddr,fork EXEC:"python3 /app/stream.py",pty,stderr