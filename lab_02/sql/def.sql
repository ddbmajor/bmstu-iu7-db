SELECT
    G.name,
    R.genre AS genreID  ,
    R.ReaderCount
FROM
    (
        SELECT DISTINCT
            B.genre,
            COUNT(B.id) AS ReaderCount
        FROM
            public.book AS B
        WHERE
            B.reader IS NOT NULL
        GROUP BY
            B.genre
    ) AS R JOIN public.genre AS G ON R.genre=G.id;