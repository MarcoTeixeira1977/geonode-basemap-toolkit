## GeoNode local installation
The `local_install` folder contains a local docker-compose automated HTTP proxy infrastructure, for local labs deployments. It assumes that the client host will resolve the `*.geonode.local` name using a hosts file. Then, all GeoNode services can be accessed through :
- geonode.local
- geonode.local/geoserver
- pgadmin.geonode.local
- portainer.geonode.local

Details :
- The GeoNode Dockerfile has been modified to include a Host file needed for django installation to complete successfully
- PGAdmin4 has been added
- PGRouting has been added to PostGIS
- Utility scripts have were added to ease the immport of OpenStreetMap based demo data (the import-stuff in docker-compose file).

#### Usage : 
Copy all the `local_install` directory into the `/opt/geonode` directory, according to the official Geonode (2.10 at time or writing) docker installation guide, then deploy the stack using the following commands : 

Frontend :
- `sudo docker-compose -f docker-compose.frontend.yml build`
- `sudo docker-compose -f docker-compose.frontend.yml up -d`

Geonode : 
- `sudo docker-compose -f docker-compose.yml -f docker-compose.override.localhost.yml build geonode pgadmin4`