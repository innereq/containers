FROM alpine

ENV SS_RUST_VERSION 1.8.23
ENV V2RAY_VERSION 1.3.1

RUN apk upgrade --available --no-cache && apk add --update --no-cache bash

WORKDIR /tmp

RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v$SS_RUST_VERSION/shadowsocks-v$SS_RUST_VERSION.x86_64-unknown-linux-musl.tar.xz \
    https://github.com/shadowsocks/v2ray-plugin/releases/download/v$V2RAY_VERSION/v2ray-plugin-linux-amd64-v$V2RAY_VERSION.tar.gz
RUN tar xfv shadowsocks-v$SS_RUST_VERSION.x86_64-unknown-linux-musl.tar.xz \
    && tar xfvz v2ray-plugin-linux-amd64-v$V2RAY_VERSION.tar.gz
RUN mv sslocal ssserver ssurl ssmanager /usr/local/bin/ \
    && mv v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin

WORKDIR /

COPY ./entrypoint.sh /opt
ENTRYPOINT ["/opt/entrypoint.sh"]
