#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly OSM_PBF_FILE="$IMPORT_DATA_DIR/import.pbf"

function exec_osm2pgsql() {
    osm2pgsql -c -d "$POSTGRES_DB" -U "$POSTGRES_USER" -H "$POSTGRES_HOST" $OSM_PBF_FILE
}

exec_osm2pgsql