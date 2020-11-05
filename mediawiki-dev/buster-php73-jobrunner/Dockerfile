FROM ghcr.io/innereq/containers/mediawiki-dev/buster-php73

RUN apt-get update && apt-get upgrade -y && apt-get install -y ffmpeg

# MediaWiki default settings
COPY PlatformSettings.php /docker/PlatformSettings.php

WORKDIR "/var/www/html/w"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]