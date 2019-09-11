FROM geonode/postgis:10
ENV IMPORT_DATA_DIR=/import

RUN mkdir -p $IMPORT_DATA_DIR
WORKDIR ${IMPORT_DATA_DIR}

CMD ["./import-gebco.sh"]