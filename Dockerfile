FROM debian:stable-slim

MAINTAINER TS <ts@ambiweb.de>

ENV HUGO_VERSION=0.52

RUN apt-get update && apt-get install -y git lftp

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp

RUN tar -xf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

WORKDIR /src

EXPOSE 1313
