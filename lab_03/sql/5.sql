DROP PROCEDURE public.retursBooks;

CREATE OR REPLACE PROCEDURE public.retursBooksProc(readerId integer, VARIADIC arr integer[])AS $$    
    UPDATE public.book
    SET reader = NULL
    WHERE reader = readerId AND id = ANY(arr);
$$ LANGUAGE SQL;


CALL public.retursBooksProc(97, 1);

SELECT * FROM public.book
WHERE reader = 97;