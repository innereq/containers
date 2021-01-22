FROM debian:buster-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y nginx ikiwiki fcgiwrap spawn-fcgi supervisor python3

COPY nginx /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisor/conf.d/default.conf

RUN useradd -m ikiwiki

ENTRYPOINT ["supervisord", "-n"]