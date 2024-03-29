#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly GEBCO_POLYGONS_FILE="$IMPORT_DATA_DIR/gebco_derived_polygons_cropped.shp"
readonly GEBCO_CONTOURS_FILE="$IMPORT_DATA_DIR/gebco_derived_contours_cropped.shp"
readonly COAST_LINES_FILE="$IMPORT_DATA_DIR/lines_cropped.shp"
readonly COAST_LAND_FILE="$IMPORT_DATA_DIR/land_cropped.shp"
readonly COAST_WATER_FILE="$IMPORT_DATA_DIR/water_cropped.shp"

function exec_psql() {
    PGPASSWORD=$POSTGRES_PASSWORD psql --host="$POSTGRES_HOST" --port="$POSTGRES_PORT" --dbname="$POSTGRES_DB" --username="$POSTGRES_USER"
}

function import_shp() {
    local shp_file=$1
    local table_name=$2
    shp2pgsql -s 4326 -I -g geometry "$shp_file" "$table_name" | exec_psql | hide_inserts
}

function hide_inserts() {
    grep -v "INSERT 0 1"
}

function drop_table() {
    local table=$1
    local drop_command="DROP TABLE IF EXISTS $table;"
    echo "$drop_command" | exec_psql
}


function import_gebco_bathy() {
#    local table_name="coast_gebco_polygon"
#    drop_table "$table_name"
#    import_shp "$GEBCO_POLYGONS_FILE" "$table_name"

#    local table_name="coast_gebco_contours"
#    drop_table "$table_name"
#    import_shp "$GEBCO_CONTOURS_FILE" "$table_name"

    local table_name="coast_osm_lines"
    drop_table "$table_name"
    import_shp "$COAST_LINES_FILE" "$table_name"

#    local table_name="coast_osm_land"
#    drop_table "$table_name"
#    import_shp "$COAST_LAND_FILE" "$table_name"

#    local table_name="coast_osm_water"
#    drop_table "$table_name"
#    import_shp "$COAST_WATER_FILE" "$table_name"
}

import_gebco_bathy