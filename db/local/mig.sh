#!/bin/bash

[ -z "$1" ] && { printf "Specify dump file.\n"; exit 1; }
[ -f "$1" ] || { printf "Dump file is wrong.\n"; exit 2; }

DUMP_FILE="$1"
DBNAME=default
CONTAINER=omoriya_db

run_sql () {
    echo "$1" | docker exec -i $CONTAINER gosu postgres psql --dbname $DBNAME
}

run_sql "DROP SCHEMA IF EXISTS public CASCADE;"
run_sql "CREATE SCHEMA public;"
run_sql "SET search_path TO public;"
run_sql "SET client_min_messages TO WARNING;"

cat $DUMP_FILE | docker exec -i $CONTAINER gosu postgres psql --dbname $DBNAME

exit 0
