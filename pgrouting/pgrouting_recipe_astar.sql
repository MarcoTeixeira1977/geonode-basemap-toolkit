--Simple request. 6400 and 7200 are randomly choosen
SELECT * FROM pgr_astar(
    'SELECT gid AS id, source, target, cost, reverse_cost, x1, y1, x2, y2 FROM public.ways',
    6400, 7420, directed := false, heuristic := 2) AS res
  	JOIN public.ways ways_vertices_pgr ON res.edge = ways_vertices_pgr.gid ;



--PostGIS function
DROP FUNCTION IF EXISTS pgr_AtoB_route(varchar, double precision, double precision, double precision, double precision);

CREATE OR REPLACE FUNCTION pgr_AtoB_route(IN tbl varchar, IN x1 double precision, IN y1 double precision, 
	IN x2 double precision, IN y2 double precision,	OUT seq integer, OUT gid integer, OUT cost double precision, OUT geom geometry)
	RETURNS SETOF record AS

$BODY$
DECLARE seq integer; statement text; rec record; source integer; target integer; 

BEGIN

-- Starting point identifier lookup
EXECUTE  'SELECT id::integer, the_geom::geometry FROM '|| tbl || '_vertices_pgr 
	ORDER BY the_geom<->ST_GeometryFromText(''POINT('|| x1 ||' '|| y1 ||' )'',4326) LIMIT 1' INTO rec; 
source := rec.id;

-- Target point identifier lookup
EXECUTE 'SELECT id::integer, the_geom::geometry FROM '|| tbl ||'_vertices_pgr 
	 ORDER BY the_geom<->ST_GeometryFromText(''POINT('|| x2 ||' '|| y2 ||' )'',4326) LIMIT 1' INTO rec; 
target := rec.id;

-- Compute the track
statement := 'SELECT * FROM pgr_astar(''SELECT gid AS id, source, target, cost, reverse_cost, x1, y1, x2, y2 
	  FROM public.'||tbl||' '', '||source||', '||target||' ) AS res 
	  JOIN public.'||tbl||' '||tbl||'_vertices_pgr ON res.edge = '||tbl||'_vertices_pgr.gid';

-- Building a SET OF records as function return.
seq := 0;
FOR rec IN EXECUTE statement
	LOOP
		gid := rec.gid; cost := rec.cost; geom := rec.the_geom; seq := seq + 1;
		RETURN NEXT;
	END LOOP;
RETURN;

END;
$BODY$

LANGUAGE 'plpgsql' VOLATILE STRICT;
