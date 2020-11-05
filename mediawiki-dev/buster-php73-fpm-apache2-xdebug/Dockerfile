FROM ghcr.io/innereq/containers/mediawiki-dev/buster-php73-fpm-apache2
ENV XDEBUG_VERSION 2.9.8

# Use Xdebug 2.9 rather than 2.6 that is packaged with stretch
# The sed line is needed to fix a bug with Tar.php packaged with stretch
# Linux users will need to override xdebug.remote_host with their hostname
# using e.g. XDEBUG_CONFIG=remote_host=yourhostname
RUN apt-get update && apt-get upgrade -y && apt-get install -y php-dev build-essential \
    && curl -o xdebug-$XDEBUG_VERSION.tgz https://xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz \
    && tar -xzf xdebug-$XDEBUG_VERSION.tgz \
    && cd xdebug-$XDEBUG_VERSION \
    && phpize \
    && ./configure --enable-xdebug \
    && make \
    && make install \
    && echo "zend_extension=/usr/lib/php/20180731/xdebug.so" >> /etc/php/7.3/fpm/conf.d/20-xdebug.ini \
    && echo "zend_extension=/usr/lib/php/20180731/xdebug.so" >> /etc/php/7.3/cli/conf.d/20-xdebug.ini \
    && echo 'xdebug.remote_host=host.docker.internal\n\
xdebug.remote_connect_back=0\n\
xdebug.remote_enable=1\n\
' | tee -a /etc/php/7.3/fpm/conf.d/20-xdebug.ini /etc/php/7.3/cli/conf.d/20-xdebug.ini \
    && cd .. \
    && rm -rf xdebug-$XDEBUG_VERSION \
    && git clone --depth=1 https://github.com/tideways/php-xhprof-extension.git \
    && cd php-xhprof-extension \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf ../php-xhprof-extension \
    && echo "extension=tideways_xhprof.so" >> /etc/php/7.3/fpm/conf.d/20-xdebug.ini \
    && echo "extension=tideways_xhprof.so" >> /etc/php/7.3/cli/conf.d/20-xdebug.ini \
    && apt-get remove --autoremove -y php-dev build-essential

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
