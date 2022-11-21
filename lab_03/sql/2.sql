CREATE OR REPLACE FUNCTION public.booksOwnedBy(readerId integer) RETURNS SETOF public.book AS $$
    SELECT *
    FROM public.book
    WHERE reader = readerId;
$$ LANGUAGE SQL;


SELECT name
FROM public.booksOwnedBy(25);