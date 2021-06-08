FROM php:8-apache-buster

RUN apt-get update && apt-get install -y wget unzip

WORKDIR /tmp

RUN wget http://pmwiki.org/pub/pmwiki/pmwiki-latest.zip
RUN wget http://pmwiki.org/pub/pmwiki/i18n/i18n-all.zip

RUN unzip pmwiki-latest.zip
RUN unzip i18n-all.zip

RUN mv pmwiki*/* /var/www/html
RUN mv scripts/xlpage-utf-8.php /var/www/html/scripts/
RUN mv UTF-8/wikilib.d/PmWikiRu* /var/www/html/wikilib.d/

WORKDIR /var/www/html/cookbook

RUN wget https://www.pmwiki.org/pmwiki/uploads/Cookbook/fastcache-php72.php -O fastcache.php
RUN wget https://raw.githubusercontent.com/erusev/parsedown/master/Parsedown.php -O parsedown.php
COPY cookbook/markdown.php .

WORKDIR /var/www/html

RUN rm -rf /tmp/*
RUN ln -sf pmwiki.php index.php
RUN umask 002 && mkdir /var/www/html/wiki.d /var/www/html/pub/htmlcache /var/www/html/uploads && chmod 777 /var/www/html/wiki.d /var/www/html/pub/htmlcache /var/www/html/uploads

COPY 000-default.conf /etc/apache2/sites-available/
RUN ln -sf /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
