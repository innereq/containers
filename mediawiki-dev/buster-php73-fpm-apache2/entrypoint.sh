#!/bin/bash

# Copy PlatformSettings.php. We do this unconditionally so that changes made
# in PlatformSettings.php in image updates are put in place each time the
# mediawiki container is created.
cp /docker/PlatformSettings.php /var/www/html/w/includes/PlatformSettings.php

BASE_DIR="/var/www/html/w"
LOCAL_SETTINGS="$BASE_DIR/LocalSettings.php"

# Backwards compatibility for existing users of
# MediaWiki-Docker
if [ -f $LOCAL_SETTINGS ]; then
	# If PlatformSettings.php is not require'd then add a line to
	# require it at the top of LocalSettings.php
	if ! grep -q PlatformSettings.php $LOCAL_SETTINGS; then
		sed -i '1 arequire_once "$IP/includes/PlatformSettings.php";' $LOCAL_SETTINGS
	fi

	# We moved to /var/www/html/w from /var/www/html in
	# I5b0ac1cbb1d1a2381eff757a1903bce2dacf09d0, migrate these paths to account
	# for that.
	if grep -q '$wgSQLiteDataDir = "/var/www/html/cache/sqlite";' $LOCAL_SETTINGS; then
		sed -i 's/\/var\/www\/html\/cache/\/var\/www\/html\/w\/cache/g' $LOCAL_SETTINGS
	fi

	if grep -q '$wgScriptPath = "";' $LOCAL_SETTINGS; then
		 sed -i 's/$wgScriptPath = "";/$wgScriptPath = "\/w\";/' $LOCAL_SETTINGS
	fi

	if [ -f $BASE_DIR/.env ] && grep -q 'MW_SCRIPT_PATH=/' $BASE_DIR/.env; then
		sed -i 's/MW_SCRIPT_PATH=\//MW_SCRIPT_PATH=\/w/' $BASE_DIR/.env
	fi
fi

php-fpm7.3 -D && /usr/sbin/apache2ctl -D FOREGROUND
