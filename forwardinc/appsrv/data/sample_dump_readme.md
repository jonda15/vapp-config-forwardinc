Forward Inc data is loaded using an SQL dump file rather than creating IME and loading Role Definition file for improved performance.

To create a new dump file

1) Set sample.env.useDump=NO in environment.properties.
2) Deploy IM Solution.
3) Dump the IM_ObjectStore database.

		docker exec [CONTAINER ID] mysqldump --routines -u caim -pHelloWorld IM_ObjectStore > sample_dump.sql
		
4) Copy sample_dump.sql into place.
