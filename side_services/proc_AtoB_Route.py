import os
import psycopg2

def atob_route():
	""" Connect to the PostgreSQL database server """
	conn = None
	cursor = None
	try:
		# Get connection params from Shell
		pg_user = os.environ.get('POSTGRES_USER')
		pg_password = os.environ.get('POSTGRES_PASSWORD')
		pg_host = os.environ.get('POSTGRES_HOST')
		pg_port = os.environ.get('POSTGRES_PORT')
		pg_database = os.environ.get('POSTGRES_DB')
		
		# Create PostgreSQL connection
		conn = psycopg2.connect(user = pg_user, password = pg_password,	host = pg_host, port = pg_port,	database = pg_database)
		cursor = conn.cursor()
		
		# >> DEBUG : get PostgreSQL version and print to check connection
		#cursor.execute("SELECT version();")
		#print("You are connected to - ", cursor.fetchone(),"\n")
	
		""" Place here a valid SQL stored procedure statement """
		# Demo : we set here the parameters for training purpose
		ways_db = "ways"
		x1 = -1.6958886
		y1 = 48.0582433
		x2 = -1.7628838
		y2 = 48.1363986
		cursor.execute("SELECT ST_MakeLine(geom) FROM pgr_atob_route(%s, %s, %s, %s, %s);", (ways_db, x1, y1, x2, y2))

		# We get and store the resulting route
		route = cursor.fetchone();
		# Demo : it's only printed
		print(route);

	except (Exception, psycopg2.Error) as error :
		print("Error while connecting to PostgreSQL", error)

	finally:
		# Close connection
		if (conn):
			cursor.close()
			conn.close()
			print("Connection to  PostgreSQL closed")

if __name__ == '__main__':
	atob_route()