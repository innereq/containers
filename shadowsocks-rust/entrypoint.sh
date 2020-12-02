#!/bin/bash

SS_PORT_DEFAULT="8388"
SS_METHOD_DEFAULT="aes-256-gcm"
SS_PLUGIN_DEFAULT="v2ray-plugin"
SS_PLUGIN_OPTS_DEFAULT="server;tls;host=$SS_HOST"

/usr/local/bin/ssserver -s "[::]:${SS_PORT:-$SS_PORT_DEFAULT}" -m "${SS_METHOD:-$SS_METHOD_DEFAULT}" -k "$SS_PASSWORD" --plugin "${SS_PLUGIN:-$SS_PLUGIN_DEFAULT}" --plugin-opts "${SS_PLUGIN_OPTS:-$SS_PLUGIN_OPTS_DEFAULT}" "$@"
