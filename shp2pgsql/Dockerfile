FROM geonode/postgis:10
ENV IMPORT_DATA_DIR=/import

RUN mkdir -p $IMPORT_DATA_DIR
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    gdal-bin
    && wget --quiet https://opendem.info/downloads/gebco_derived_polygons.zip
    && unzip -oj  gebco_derived_polygons.zip -d $IMPORT_DATA_DIR \
    && rm gebco_derived_polygons.zip
    && wget --quiet https://opendem.info/downloads/gebco_derived_contours.zip
    && unzip -oj gebco_derived_contours.zip -d $IMPORT_DATA_DIR \
    && rm gebco_derived_contours.zip

WORKDIR ${IMPORT_DATA_DIR}
RUN ogr2ogr -f 'ESRI Shapefile' gebco_derived_polygons_cropped.shp gebco_derived_polygons.shp
    && ogr2ogr -f 'ESRI Shapefile' gebco_derived_contours_cropped.shp gebco_derived_contours.shp

CMD ["./import-gebco.sh"]