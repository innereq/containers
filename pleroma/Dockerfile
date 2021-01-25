FROM elixir:1.9-alpine as build

ARG PLEROMA_BRANCH=release/2.2.2
ENV MIX_ENV=prod

RUN apk add git gcc g++ musl-dev make cmake file-dev \
    && mkdir /build && cd /build \
    && git clone --depth=1 --single-branch -b $PLEROMA_BRANCH https://git.pleroma.social/pleroma/pleroma . \
	&& echo "import Mix.Config" > config/prod.secret.exs \
	&& mix local.hex --force \
	&& mix local.rebar --force \
	&& mix deps.get --only prod \
	&& mkdir release \
	&& mix release --path release

FROM alpine:3.13

LABEL maintainer="ops@pleroma.social" \
    org.opencontainers.image.title="pleroma" \
    org.opencontainers.image.description="Pleroma for Docker" \
    org.opencontainers.image.authors="ops@pleroma.social" \
    org.opencontainers.image.vendor="pleroma.social" \
    org.opencontainers.image.documentation="https://git.pleroma.social/pleroma/pleroma" \
    org.opencontainers.image.licenses="AGPL-3.0" \
    org.opencontainers.image.url="https://pleroma.social"

ARG HOME=/opt/pleroma
ARG DATA=/var/lib/pleroma

RUN echo "https://nl.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories &&\
	apk update &&\
	apk add exiftool imagemagick libmagic ncurses postgresql-client ffmpeg &&\
	adduser --system --shell /bin/false --home ${HOME} pleroma &&\
	mkdir -p ${DATA}/uploads &&\
	mkdir -p ${DATA}/static &&\
	chown -R pleroma ${DATA} &&\
	mkdir -p /etc/pleroma &&\
	chown -R pleroma /etc/pleroma

USER pleroma

COPY --from=build --chown=pleroma:0 /build/release ${HOME}

COPY ./config/docker.exs /etc/pleroma/config.exs
COPY ./docker-entrypoint.sh ${HOME}

EXPOSE 4000

ENTRYPOINT ["/opt/pleroma/docker-entrypoint.sh"]
