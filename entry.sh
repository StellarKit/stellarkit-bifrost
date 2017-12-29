#!/usr/bin/env sh

set -e

# DB_URL=$BIFROST_DB_DSN DB_DUMP_FILE=/go/src/github.com/stellar/go/services/bifrost/database/migrations/01_init.sql /go/bin/initbifrost

build-config /config.toml > /opt/bifrost/bifrost.cfg

/go/bin/bifrost server -c /opt/bifrost/bifrost.cfg
