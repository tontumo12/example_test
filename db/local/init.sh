#!/bin/bash

SCRIPT_PATH=/docker-entrypoint-initdb.d
DBNAME=omoriya
CONTAINER=omoriya_db

run () {
    docker exec $CONTAINER gosu postgres psql --dbname $DBNAME -f "$1"
}

run $SCRIPT_PATH/init.sql

exit 0
