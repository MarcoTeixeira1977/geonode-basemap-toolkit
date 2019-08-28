# GeoNode BaseMap Toolkit
Required settings on top of the default docker-compose GeoNode deployment, automating stuff to create a nice OSM based Basemap for GeoNode on a given area. The docker-compose files are intended to work [with my Docker homelab setup](https://github.com/ginkun/frontend-https-revproxy.git).

It assumes that you downloaded a desired PBF file (ex: from [Geofabrik](http://download.geofabrik.de/), renamed `import.pbf` and placed into the `osm2pgsql` directory.

## Layergroup and associated styles automated Creation into Geoserver / GeoNode. 
Many thanks to [this article](https://tipsforgis.wordpress.com/tag/delft/) for the initial inspiration which served as a strong base for this publication.
