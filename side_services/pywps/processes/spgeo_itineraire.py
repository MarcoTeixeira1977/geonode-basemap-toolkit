import os, psycopg2
from pywps import Process, LiteralInput, LiteralOutput, Format

class AtoBRoute(Process):
    def __init__(self):
        inputs = [LiteralInput('x1', 'A point X', data_type='float'),
                  LiteralInput('y1', 'A point Y', data_type='float'),
                  LiteralInput('x2', 'B point X', data_type='float'),
                  LiteralInput('y2', 'B point Y', data_type='float')]
        outputs = [LiteralOutput(
            'path', 'Route path from A to B', data_type='string')]

        super(AtoBRoute, self).__init__(
            self._handler,
            identifier='atob_route',
            title='Define an ASTAR optimized path from A to B',
            version='0.0.1',
            inputs=inputs,
            outputs=outputs,
            store_supported=True,
            status_supported=True
        )

    @staticmethod
    def _handler(request, response):
        x1=request.inputs['x1'][0].data
        y1=request.inputs['y1'][0].data
        x2=request.inputs['x2'][0].data
        y2=request.inputs['y2'][0].data

        pg_link = None
        cursor = None
        # Get connection params from Shell
        pg_user = os.environ.get('POSTGRES_USER')
        pg_password = os.environ.get('POSTGRES_PASSWORD')
        pg_host = os.environ.get('POSTGRES_HOST')
        pg_port = os.environ.get('POSTGRES_PORT')
        pg_database = os.environ.get('POSTGRES_DB')

        # Create PostgreSQL connection
        pg_link = psycopg2.connect(
            user=pg_user, password=pg_password,     host=pg_host, port=pg_port,     database=pg_database)
        cursor = pg_link.cursor()

        ways_db = "ways"
        cursor.execute(
            "SELECT ST_MakeLine(geom) FROM pgr_atob_route(%s, %s, %s, %s, %s);", (ways_db, x1, y1, x2, y2))

        # We get and store the resulting route
        astarpath = cursor.fetchone()

        # Close connection
        if (pg_link):
            cursor.close()
            pg_link.close()

        response.outputs['path'].data = astarpath
        return response

def main():
    x1=-1.6958886
    y1=48.0582433
    x2=-1.7628838
    y2=48.1363986
    # Get connection params from Shell
    pg_user = os.environ.get('POSTGRES_USER')
    pg_password = os.environ.get('POSTGRES_PASSWORD')
    pg_host = os.environ.get('POSTGRES_HOST')
    pg_port = os.environ.get('POSTGRES_PORT')
    pg_database = os.environ.get('POSTGRES_DB')

    # Create PostgreSQL connection
    pg_link = psycopg2.connect(
        user=pg_user, password=pg_password,     host=pg_host, port=pg_port,     database=pg_database)
    cursor = pg_link.cursor()

    ways_db = "ways"
    cursor.execute(
        "SELECT ST_MakeLine(geom) FROM pgr_atob_route(%s, %s, %s, %s, %s);", (ways_db, x1, y1, x2, y2))

    # We get and store the resulting route
    astarpath = cursor.fetchone()

    cursor.close()
    pg_link.close()
    print("Connection to  PostgreSQL closed")
    print(astarpath)

if __name__ == "__main__":
    main()
