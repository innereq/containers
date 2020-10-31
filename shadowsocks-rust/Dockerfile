FROM alpine AS builder

ENV SS_RUST_VERSION 1.8.20
ENV V2RAY_VERSION 1.3.1

RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v$SS_RUST_VERSION/shadowsocks-v$SS_RUST_VERSION.x86_64-unknown-linux-musl.tar.xz
RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v$V2RAY_VERSION/v2ray-plugin-linux-amd64-v$V2RAY_VERSION.tar.gz

RUN tar xfv shadowsocks-v$SS_RUST_VERSION.x86_64-unknown-linux-musl.tar.xz
RUN tar xfvz v2ray-plugin-linux-amd64-v$V2RAY_VERSION.tar.gz

FROM alpine

RUN apk add --update --no-cache bash

COPY --from=builder /sslocal /ssmanager /ssserver /ssserver /usr/local/bin/
COPY --from=builder /v2ray-plugin_linux_amd64 /usr/local/bin/v2ray-plugin
COPY ./entrypoint.sh /opt

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["/usr/local/bin/ssserver"]
