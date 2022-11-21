DROP FUNCTION IF EXISTS fun_recursive(ct INT);

CREATE FUNCTION fun_recursive (ct INT)
RETURNS TABLE (
	id INT, 
	manager INT
) LANGUAGE plpgsql
AS $$
BEGIN
    RETURN query SELECT ct, (SELECT managerid FROM public.employee as e WHERE e.id = ct);
    IF (SELECT managerid FROM public.employee AS e WHERE e.id = ct) IS NOT NULL THEN
        RETURN query 
		SELECT * 
		FROM fun_recursive((SELECT managerid FROM public.employee AS e WHERE e.id = ct));
    END IF;
END $$;

SELECT * FROM fun_recursive(4);