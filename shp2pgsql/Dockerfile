FROM geonode/postgis:10
ENV IMPORT_DATA_DIR=/import

RUN mkdir -p $IMPORT_DATA_DIR
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    gdal-bin

RUN wget https://opendem.info/downloads/gebco_derived_polygons.zip --quiet --no-check-certificate\
    && unzip -d $IMPORT_DATA_DIR -oj gebco_derived_polygons.zip gebco_derived_polygons.shp
RUN wget https://opendem.info/downloads/gebco_derived_contours.zip --quiet --no-check-certificate\
    && unzip -d $IMPORT_DATA_DIR -oj gebco_derived_contours.zip gebco_derived_contours.shp

WORKDIR ${IMPORT_DATA_DIR}
RUN ogr2ogr -f 'ESRI Shapefile' gebco_derived_polygons_cropped.shp gebco_derived_polygons.shp -clipsrc ${GEBCO_CLIPAREA}\
    && ogr2ogr -f 'ESRI Shapefile' gebco_derived_contours_cropped.shp gebco_derived_contours.shp -clipsrc ${GEBCO_CLIPAREA}

CMD ["./import-gebco.sh"]