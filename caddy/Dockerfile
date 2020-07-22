FROM alpine

RUN apk -U upgrade && apk add --no-cache curl tar gzip

WORKDIR /tmp

RUN curl -o caddy.tar.gz -X GET "https://caddyserver.com/download/linux/amd64?plugins=http.cache,http.webdav,http.cors,http.expires&license=personal&telemetry=off"

RUN tar -xf caddy.tar.gz && mv caddy /opt/caddy && mkdir /etc/caddy

WORKDIR /etc/caddy

CMD ["/opt/caddy", "-conf", "/etc/caddy/caddy.conf", "-agree"]