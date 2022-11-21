DROP FUNCTION public.retursBooks;

CREATE OR REPLACE FUNCTION public.retursBooks(readerId integer, VARIADIC arr integer[]) RETURNS TABLE(name TEXT) AS $$    
    UPDATE public.book
    SET reader = NULL
    WHERE reader = readerId AND id = ANY(arr);

    SELECT name FROM public.book
    WHERE reader = readerId;
$$ LANGUAGE SQL;


SELECT *
FROM public.retursBooks(97, 1);
