#!/bin/sh
set -e

export INFLUX_CMD="$SNAP/bin/influx -execute "

export DBNAME="db"
export RETENTION="365d"
export INIT_QUERY="CREATE DATABASE $DBNAME WITH DURATION $RETENTION"

# Wait for Influx server to come up properly
while ! $INFLUX_CMD "$INIT_QUERY"
do
    echo 'Waiting for InfluxDB to become available...'
    sleep 1
done

echo 'Initialized database'