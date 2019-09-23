/* 
    - 10/09/2019 : TODO : 
    - Make as a proper function 
    - Calculate node from coordinates
    - calculate distance angle (degree) from meters (0.05 = approx. 6km)
*/

WITH alphashape AS (
    -- Below, replace 2 by the appropriate node, and 0.05 by appropriate distance (cost) in degree
    SELECT pgr_alphashape('
        WITH dd AS (
            SELECT * FROM pgr_drivingDistance(
                ''SELECT gid as id, source, target, cost FROM public.ways'', 6000, 0.05
            )
        ),
        dd_points AS (
            SELECT id::integer, ST_X(the_geom)::float AS x, ST_Y(the_geom)::float AS y
            FROM public.ways_vertices_pgr w, dd d
            WHERE w.id = d.node
        )
        SELECT * FROM dd_points
    ')
),
alphapoints AS (
    SELECT ST_MakePoint((pgr_alphashape).x, (pgr_alphashape).y) FROM alphashape
),
alphaline AS (
    SELECT ST_MakeLine(ST_MakePoint) FROM alphapoints
)
SELECT 1 as id, ST_SetSRID(ST_MakePolygon(ST_AddPoint(ST_MakeLine, ST_StartPoint(ST_MakeLine))), 4326) AS the_geom FROM alphaline;