CREATE OR REPLACE FUNCTION public.getBookNumberByYear(year INT)
RETURNS INT 
AS $$
	query = '''
        SELECT year
        FROM public.book 
        WHERE year = %d;
            ''' %(year)
	res = plpy.execute(query)	

	if res is not None:
		counter = 0

		for book in res:
			counter += 1

		return counter
	
$$ LANGUAGE PLPYTHON3U;

SELECT name, year, public.getBookNumberByYear(year) as booksInYear
FROM book;