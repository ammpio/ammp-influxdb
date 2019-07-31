#!/bin/sh
set -e

export DBNAME="db"
export RETENTION="365d"
export CREATE_DB_QUERY="CREATE DATABASE $DBNAME WITH DURATION $RETENTION"

$SNAP/bin/influx -execute "$CREATE_DB_QUERY"