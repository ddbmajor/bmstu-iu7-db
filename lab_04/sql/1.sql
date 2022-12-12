CREATE EXTENSION plpython3u;

CREATE OR REPLACE FUNCTION public.publisherGOST(city VARCHAR, name VARCHAR)
RETURNS TEXT 
AS $$
    return city + ": " + name
$$ LANGUAGE PLPYTHON3U;

SELECT public.publisherGOST('Podolsk', 'Apress');
