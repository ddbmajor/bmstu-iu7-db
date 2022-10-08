WITH
    CTE(reader, books_owned) AS (
        SELECT
            reader,
            COUNT(id)
        FROM
            public.book
        GROUP BY
            reader
    )
SELECT
    AVG(books_owned) AS "AVG"
FROM
    CTE;