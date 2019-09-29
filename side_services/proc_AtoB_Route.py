import os
import psycopg2

""" PostgreSQL connection """

try:
	# Get connection params from Shell
	pg_user = os.environ.get('POSTGRES_USER')
	pg_password = os.environ.get('POSTGRES_PASSWORD')
	pg_host = os.environ.get('POSTGRES_HOST')
	pg_port = os.environ.get('POSTGRES_PORT')
	pg_database = os.environ.get('POSTGRES_DB')

	# Create PostgreSQL connection
	conn = psycopg2.connect(user = pg_user, password = pg_password,
				host = pg_host, port = pg_port,
				database = pg_database)
	cursor = conn.cursor()

	# Get PostgreSQL version and print to check connection
	cursor.execute("SELECT version();")
	print("You are connected to - ", cursor.fetchone(),"\n")

	""" Place here the WPS SQL View code and parameters """
	# https://pynative.com/python-postgresql-select-data-from-table/ for examples
	

except (Exception, psycopg2.Error) as error :
	print("Error while connecting to PostgreSQL", error)

finally:
	# Close connection
	if (conn):
		cursor.close()
		conn.close()
		print("Connection to  PostgreSQL closed")
