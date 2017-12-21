#!/usr/bin/env sh

set -e

build-config /config.toml > /opt/bifrost/bifrost.cfg

/go/bin/bifrost server -c /opt/bifrost/bifrost.cfg
