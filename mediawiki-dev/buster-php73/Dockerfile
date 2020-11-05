FROM mediawiki-dev-buster

# Install PHP dependencies:

# Not installing php-tidy here - see https://phabricator.wikimedia.org/T191771
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php-apcu php-bcmath php-cli php-curl php-gd php-gmp php-intl php-ldap \
    php-mbstring php-mysql php-pgsql php-sqlite3 php-xml php-zip php-redis \
    jq curl

# Install XDebug but disable it by default due to its performance impact:
RUN apt-get install php-xdebug \
    && phpdismod xdebug

# Install composer:
RUN cd /tmp && curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --version="1.10.17" --install-dir=/usr/local/bin --filename=composer \
    cd /