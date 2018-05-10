#!/bin/sh

set -e

function main() {
  build-config /configs/config.toml > /opt/bifrost/bifrost.cfg

  build-config /configs/pgpass-config > /root/.pgpass
  chmod 600 /root/.pgpass

  while ! psql -h bifrostpostgres -U $POSTGRES_USER -c 'select 1' bifrostdb &> /dev/null
  do
    echo "Waiting for bifrostdb to be available..."
    sleep 1
  done

  start_bifrost
}

function start_bifrost() {
  /go/bin/bifrost server -debug true -c /opt/bifrost/bifrost.cfg
}

main
