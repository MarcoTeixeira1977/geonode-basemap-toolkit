#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly OSM_PBF_FILE="$IMPORT_DATA_DIR/import.pbf"
readonly OSM_MAPZEN_STYLEFILE="$IMPORT_DATA_DIR/default.style"

function exec_osm2pgsql() {
    osm2pgsql -c -E 4326 -d "$POSTGRES_DB" -U "$POSTGRES_USER" -H "$POSTGRES_HOST" -S "$OSM_MAPZEN_STYLEFILE"  $OSM_PBF_FILE
}

exec_osm2pgsql
