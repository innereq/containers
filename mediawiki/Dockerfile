FROM mediawiki:1.35.0

ENV MEDIAWIKI_BRANCH REL1_35

#RUN cd /tmp && curl -sS https://getcomposer.org/installer -o composer-setup.php \
#	&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
#	&& cd /var/www/html

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Echo \
	/var/www/html/extensions/Echo

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Tabs \
	/var/www/html/extensions/Tabs

RUN git clone --depth 1 \
	https://github.com/sigbertklinke/Iframe \
	/var/www/html/extensions/Iframe

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/BetaFeatures \
	/var/www/html/extensions/BetaFeatures

#RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
#	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TemplateData \
#	/var/www/html/extensions/TemplateData

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups \
	/var/www/html/extensions/Popups

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RevisionSlider \
	/var/www/html/extensions/RevisionSlider

RUN git clone --depth 1 -b v2.6.1 \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/WikiSEO \
	/var/www/html/extensions/WikiSEO

#RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
#	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VisualEditor \
#	/var/www/html/extensions/VisualEditor \
#	&& cd /var/www/html/extensions/VisualEditor \
#	&& git submodule update --init \
#	&& cd /var/www/html

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RSS \
	/var/www/html/extensions/RSS

RUN git clone --depth 1 -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UploadWizard \
	/var/www/html/extensions/UploadWizard
