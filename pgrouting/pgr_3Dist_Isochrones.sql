/*
  - Source : https://georepublic.info/de/blog/2017/catchment-area-calculation-with-pgrouting/
  - TODO :
    > Proper function wrapping
    > pyWPS wrapper
    > Use "with" structures instead of raw tables creation
*/

/* With pgr_drivingDistance we can calculate the distance (cost) from a start node to any other node 
in the network until a maximum cost is reached. Because our network data is rather small, 
the maximum cost of 3600 seconds starting from node 15632 covers the whole area. 
And for simplicity we store the query result in a table distances. */

DROP TABLE IF EXISTS distances;
CREATE TABLE distances AS (SELECT a.node AS id, a.agg_cost AS distance, b.the_geom
    FROM pgr_drivingDistance(
        'SELECT gid AS id, source, target, cost_s as cost, reverse_cost_s as reverse_cost FROM public.ways',
        15632,
        3600,
        true
    ) a, ways_vertices_pgr b WHERE a.node = b.id
);

/* Note: the cost parameter in pgRouting can be computed as you like. osm2pgrouting already pre-computes 
some costs based on distance and on time, using the settings from the mapconfig.xml file. */

DO $$
DECLARE
  dist int;
  arr int[] := ARRAY[300,200,100,50];
BEGIN
  DROP TABLE IF EXISTS catchments;
  CREATE TABLE catchments(
    distance integer,
    the_geom geometry(polygon,4326)
  );

  FOREACH dist IN ARRAY arr
  LOOP
    RAISE INFO 'Distance is %', dist;
    WITH polygon AS (
      SELECT pgr_pointsAsPolygon(
        'SELECT id, ST_X(the_geom) AS x, ST_Y(the_geom) AS y
          FROM distances WHERE distance <= ' || dist || ';',
          0.00001
        ) AS geom
      )
      INSERT INTO catchments (distance,the_geom)
        SELECT dist, ST_SetSRID(polygon.geom,4326) FROM polygon;
    END LOOP;
END$$;
