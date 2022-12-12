\t \a

\o datasets/authors.json
SELECT ROW_TO_JSON(a)
FROM public.author a;

\o datasets/books.json
SELECT ROW_TO_JSON(b)
FROM public.book b;

\o datasets/cards.json
SELECT ROW_TO_JSON(c)
FROM public.card c;

\o datasets/genres.json
SELECT ROW_TO_JSON(g)
FROM public.genre g;

\o datasets/publishers.json
SELECT ROW_TO_JSON(p)
FROM public.publisher p;

\o datasets/readers.json
SELECT ROW_TO_JSON(r)
FROM public.reader r;

\o datasets/types.json
SELECT ROW_TO_JSON(t)
FROM public.type t;