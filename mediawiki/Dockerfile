FROM mediawiki:1.35.0

ENV MEDIAWIKI_BRANCH REL1_35

RUN apt-get update && apt-get upgrade -y # && apt-get install unzip

#RUN cd /tmp && curl -sS https://getcomposer.org/installer -o composer-setup.php \
#	&& php composer-setup.php --version="1.10.17" --install-dir=/usr/local/bin --filename=composer \
#	&& cd /var/www/html

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Echo \
	/var/www/html/extensions/Echo

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Tabs \
	/var/www/html/extensions/Tabs

RUN git clone --depth 1 --single-branch \
	https://github.com/sigbertklinke/Iframe \
	/var/www/html/extensions/Iframe

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/BetaFeatures \
	/var/www/html/extensions/BetaFeatures

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups \
	/var/www/html/extensions/Popups

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RevisionSlider \
	/var/www/html/extensions/RevisionSlider

RUN git clone --depth 1 --single-branch -b v2.6.1 \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/WikiSEO \
	/var/www/html/extensions/WikiSEO

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RSS \
	/var/www/html/extensions/RSS

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UploadWizard \
	/var/www/html/extensions/UploadWizard
	
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge \
	/var/www/html/extensions/UserMerge

#RUN COMPOSER=composer.local.json composer require --no-update mediawiki/chameleon-skin:~3.0 && \
#    composer update mediawiki/chameleon-skin --no-dev -o
