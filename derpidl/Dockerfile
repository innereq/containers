FROM alpine:edge AS builder

WORKDIR /opt

RUN apk add --update build-base git qt5-qtbase-dev
RUN git clone --depth=1 --single-branch https://github.com/Sibusten/derpibooru-downloader

WORKDIR /opt/derpibooru-downloader

RUN qmake-qt5
RUN make

FROM alpine:edge

RUN apk add --update --no-cache qt5-qtbase bash

COPY --from=builder /opt/derpibooru-downloader/DerpibooruDownloaderCmd/DerpibooruDownloaderCmd /opt
COPY ./DerpibooruDownloader.ini /opt
COPY ./entrypoint.sh /opt

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["/opt/DerpibooruDownloaderCmd"]