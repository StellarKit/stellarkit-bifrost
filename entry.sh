#!/usr/bin/env sh

set -e

function main() {
  # while ! psql -U bifrost -c 'select 1' bifrostdb &> /dev/null ; do
  #   echo "Waiting for bifrost postgres to be available..."
  #   sleep 1
  # done
  sleep 1

  init_bifrost_db
  start_bifrost
}

function init_bifrost_db() {
	if [ -f /opt/bifrost/.bifrostdb-initialized ]; then
		echo "Bifrost DB: already initialized"
		return 0
	fi

  echo "Bifrost DB: Initializing"
  DB_URL=$BIFROST_DB_DSN
  DB_DUMP_FILE=/go/src/github.com/stellar/go/services/bifrost/database/migrations/01_init.sql
  /go/bin/initbifrost

  # not sure if needed, is this async?
  sleep 1

	touch /opt/bifrost/.bifrostdb-initialized
 }

function start_bifrost() {
  build-config /config.toml > /opt/bifrost/bifrost.cfg

  /go/bin/bifrost server -c /opt/bifrost/bifrost.cfg
}

main
