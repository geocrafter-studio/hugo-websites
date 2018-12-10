FROM alpine:3.8

MAINTAINER fernando.ribeiro@geocrafter.eu

ENV HUGO_VERSION=0.52

RUN apk --no-cache add \
        curl \
        git \
        ca-certificates \
    && curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
        -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && apk del curl \
    && mkdir /src \
    && rm -rf /tmp/*

VOLUME /src

WORKDIR /src
