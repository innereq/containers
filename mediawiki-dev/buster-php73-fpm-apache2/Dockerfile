FROM mediawiki-dev-buster-php73

# We don't want the default index.html for running PHP applications, and
# xdebug is a major performance drag, so disable it here (it's already
# been disabled for CLI PHP in stretch-php72).
RUN apt-get update && apt-get upgrade -y && apt-get install -y apache2 php-fpm \
    && rm /var/www/html/index.html \
    && phpdismod xdebug \
    && a2enmod proxy_fcgi \
    && a2enmod mpm_event \
    && a2enmod rewrite \
    && a2enmod http2 \
    && a2enmod cache

# Apache configuration:
COPY ./ports.conf /etc/apache2/ports.conf
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache2.conf /etc/apache2/apache2.conf
COPY ./envvars /etc/apache2/envvars

# php-fpm configuration:
COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

# MediaWiki-specific php.ini settings
# upload_max_filesize and post_max_size here match production, per T246930
RUN echo 'opcache.file_update_protection=0\n\
opcache.memory_consumption=256\n\
opcache.max_accelerated_files=24000\n\
opcache.max_wasted_percentage=10\n\
opcache.fast_shutdown=1\n\
zlib.output_compression=On\n\
upload_max_filesize=100M\n\
post_max_size=100M\n' | tee -a /etc/php/7.3/fpm/php.ini /etc/php/7.3/cli/php.ini

# MediaWiki default settings
COPY PlatformSettings.php /docker/PlatformSettings.php

EXPOSE 8080
# EXPOSE 443

WORKDIR "/var/www/html/w"

COPY entrypoint.sh /entrypoint.sh
COPY install.sh /docker/install.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
