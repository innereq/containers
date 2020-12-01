#!/bin/bash
set -e

BOORU_URL_DEFAULT="https://derpibooru.org"
BOORU_FILTER_ID_DEFAULT="56027"
BOORU_OUTPUT_DIR_DEFAULT="/mnt/out/{id}.{ext}"

/opt/DerpibooruDownloaderCmd -a "$BOORU_API_KEY" -b "${BOORU_URL:-$BOORU_URL_DEFAULT}" -f "${BOORU_FILTER_ID:-$BOORU_FILTER_ID_DEFAULT}" -q "$BOORU_QUERY" -I "${BOORU_OUTPUT_DIR:-$BOORU_OUTPUT_DIR_DEFAULT}" "$@"