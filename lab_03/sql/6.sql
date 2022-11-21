DROP PROCEDURE IF EXISTS proc_recursive(ct INT);

CREATE PROCEDURE proc_recursive (ct INT)
LANGUAGE plpgsql
AS $$
DECLARE tmp INT;
BEGIN
    UPDATE public.employee
    SET title = CONCAT(title, '!')
    WHERE id = ct;
    IF EXISTS (SELECT e.managerid
        FROM public.employee AS e
        WHERE id = ct)
    THEN tmp := (SELECT e.managerid
        FROM public.employee AS e
        WHERE id = ct);
        CALL proc_recursive(tmp);
    END IF;
END $$;

CALL proc_recursive(4);

SELECT * FROM public.employee;