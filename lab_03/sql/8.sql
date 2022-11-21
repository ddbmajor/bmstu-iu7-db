CREATE OR REPLACE PROCEDURE all_tables() AS
$$
DECLARE 
	cur CURSOR
	for SELECT table_name, table_schema
	FROM (
		SELECT table_name, table_schema
		FROM information_schema.tables
		WHERE table_schema NOT IN ('information_schema','pg_catalog')
	) AS tmp;
		 ROW record;
BEGIN
	OPEN cur;
	LOOP
		FETCH cur INTO row;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '{table : %, schema : %}', row.table_name, row.table_schema;
	END LOOP;
	CLOSE cur;
END
$$ LANGUAGE plpgsql;

CALL all_tables();