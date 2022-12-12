CREATE OR REPLACE FUNCTION public.getBooksByYear(year INT)
RETURNS TABLE
(
    id INT, 
    name VARCHAR,
    year INT
)
AS $$
	query = '''
        SELECT id, name, year
        FROM public.book;
            '''
	res = plpy.execute(query)	

	res_list = []
	if res is not None:
		for book in res:
			if book["year"] == year:
				res_list.append(book)
		return res_list
		
$$ LANGUAGE PLPYTHON3U;

SELECT *
FROM public.getBooksByYear(1999);