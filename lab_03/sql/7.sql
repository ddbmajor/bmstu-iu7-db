CREATE OR REPLACE PROCEDURE proc_cur(id_start INT, id_end INT) AS
$$
DECLARE cur CURSOR
	FOR SELECT *
	FROM public.employee
	WHERE id BETWEEN id_start AND id_end;
line RECORD;

BEGIN
	OPEN cur;
	LOOP
		FETCH cur INTO line;
		EXIT WHEN NOT FOUND;
		UPDATE public.employee 
		SET title = CONCAT(title, '!')
		WHERE employee.id = line.id;
	END LOOP;
	CLOSE cur;
END;
$$ LANGUAGE plpgsql;

CALL proc_cur(1, 2);