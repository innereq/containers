FROM mediawiki:1.35.1

ENV MEDIAWIKI_BRANCH REL1_35

RUN apt-get update && apt-get upgrade -y && apt-get install -y unzip

# https://www.mediawiki.org/wiki/Composer
RUN cd /tmp && curl -sS https://getcomposer.org/installer -o composer-setup.php \
	&& php composer-setup.php --version="1.10.17" --install-dir=/usr/local/bin --filename=composer \
	&& cd /var/www/html

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Echo \
	/var/www/html/extensions/Echo

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/BetaFeatures \
	/var/www/html/extensions/BetaFeatures

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Popups \
	/var/www/html/extensions/Popups

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RevisionSlider \
	/var/www/html/extensions/RevisionSlider

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UploadWizard \
	/var/www/html/extensions/UploadWizard

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/UserMerge \
	/var/www/html/extensions/UserMerge

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/AutoCreateCategoryPages \
	/var/www/html/extensions/AutoCreateCategoryPages

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/TemplateStyles \
	/var/www/html/extensions/TemplateStyles \
	&& cd /var/www/html/extensions/TemplateStyles \
	&& composer install --no-dev \
	&& cd /var/www/html

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MobileFrontend \
	/var/www/html/extensions/MobileFrontend

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/mediawiki/skins/MinervaNeue \
	/var/www/html/skins/MinervaNeue

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/MsUpload \
	/var/www/html/extensions/MsUpload

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/RelatedArticles \
	/var/www/html/extensions/RelatedArticles

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CommentStreams \
	/var/www/html/extensions/CommentStreams

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/VEForAll \
	/var/www/html/extensions/VEForAll

RUN rm -rf /var/www/html/skins/Vector && \
	git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/mediawiki/skins/Vector \
	/var/www/html/skins/Vector

RUN git clone --depth 1 --single-branch \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PageForms \
	/var/www/html/extensions/PageForms

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
	https://gerrit.wikimedia.org/r/p/mediawiki/extensions/HeadScript \
	/var/www/html/extensions/HeadScript

RUN COMPOSER=composer.local.json composer require --no-update mediawiki/semantic-media-wiki:~3.2 \
	&& composer update mediawiki/semantic-media-wiki --no-dev -o

RUN COMPOSER=composer.local.json composer require --no-update mediawiki/semantic-meta-tags:~3.0 \
	&& composer update mediawiki/semantic-meta-tags --no-dev -o

RUN COMPOSER=composer.local.json composer require --no-update mediawiki/semantic-result-formats:~3.1 \
	&& composer update mediawiki/semantic-result-formats --no-dev -o

RUN COMPOSER=composer.local.json composer require --no-update mediawiki/semantic-extra-special-properties:~2.1 \
	&& composer update mediawiki/semantic-extra-special-properties --no-dev -o

# Strange bug: https://www.mediawiki.org/wiki/Topic:Vhevkhbn0f56oo3r
RUN cd /var/www/html/extensions/OATHAuth \
	&& composer install --no-dev \
	&& cd /var/www/html
