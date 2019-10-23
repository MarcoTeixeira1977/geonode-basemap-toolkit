 cd geonode-basemap-toolkit/geoserver/
 mkdir blob 
 955  cd blob
  956  wget --no-check-certificate --progress=bar:force:noscroll  \
      https://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-vectortiles-plugin.zip \
    && unzip -q -n geoserver-2.15.2-vectortiles-plugin.zip \
    && rm geoserver-2.15.2-vectortiles-plugin.zip \
    && wget --no-check-certificate --progress=bar:force:noscroll \
       https://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-netcdf-plugin.zip \
    && unzip -q -n geoserver-2.15.2-netcdf-plugin.zip \
    && rm geoserver-2.15.2-netcdf-plugin.zip \
    && wget --no-check-certificate --progress=bar:force:noscroll \
       https://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-grib-plugin.zip \
    && unzip -q -n geoserver-2.15.2-grib-plugin.zip \
    && rm geoserver-2.15.2-grib-plugin.zip
    && wget --no-check-certificate --progress=bar:force:noscroll \
       https://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/extensions/geoserver-2.15.2-wc2_0-eo-plugin.zip
  965  sudo chmod 644 ./*
  966  sudo chown root:root ./*
  967  sudo cp -n ./* /var/lib/docker/volumes/geonode-gslibsdir/_data
  968  cd ../../..
  969  sudo docker-compose restart geoserver
