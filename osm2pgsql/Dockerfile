FROM geonode/postgis:10
ENV IMPORT_DATA_DIR=/import

RUN mkdir -p $IMPORT_DATA_DIR
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    osm2pgsql

WORKDIR ${IMPORT_DATA_DIR}
COPY . ${IMPORT_DATA_DIR}

CMD ["./import-osm.sh"]