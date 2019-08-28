#  
#  FullStack Labs
#  -> Batch create geoserver layers + associated styles
#     Assuming that your have a PostGIS database containing 
#     a full OSM dump on the desired area
#
restapi=http://172.23.0.3:8080/geoserver/rest
login=admin:geoserver
workspace=geonode
store=GeoNode_PostGIS

for sldfile in styles/*.sld; do

  # -> Get the Layer name from the SLD filename
  #    Every SLD filename should match a corresponding PostGIS table.
  #    Therefore, we're building a full-featured basemap in seconds!
  layername=`basename $sldfile .sld`

  # -> Assuming the table already exists in the database and is named 
  #    $layername, this step automatically creates a so-called layer
  curl -v -u $login -XPOST -H "Content-type: text/xml" \
                    -d "<featureType><name>$layername</name></featureType>" \
                    $restapi/workspaces/$workspace/datastores/$store/featuretypes?recalculate=nativebbox,latlonbbox

  # -> Create an empty style object in the workspace, using the same name
  curl -v -u $login -XPOST -H "Content-type: text/xml" \
                    -d "<style><name>$layername</name><filename>$sldfile</filename></style>" \
                    $restapi/workspaces/$workspace/styles

  # -> Upload the SLD definition to the named style
  curl -v -u $login -XPUT -H "Content-type: application/vnd.ogc.sld+xml" \
                    -d @$sldfile \
                    $restapi/workspaces/$workspace/styles/$layername

  # -> Define this as the default layer' style
  curl -v -u $login -XPUT -H "Content-type: text/xml" \
                    -d "<layer><enabled>true</enabled><defaultStyle><name>$layername</name><workspace>$workspace</workspace></defaultStyle></layer>" \
                    $restapi/layers/$workspace:$layername

done

  curl -v -u $login -XPOST -d layergroup.xml -H "Content-type: text/xml" $restapi/layergroups