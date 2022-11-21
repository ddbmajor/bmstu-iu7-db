CREATE OR REPLACE FUNCTION public.bookOwned(readerId integer) RETURNS integer AS $$
    SELECT COUNT(*)
    FROM public.book
    WHERE reader = readerId;
$$ LANGUAGE SQL;

SELECT public.bookOwned(3);