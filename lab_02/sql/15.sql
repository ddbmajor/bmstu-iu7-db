SELECT
    G.name,
    R.GenreCount
FROM
    public.genre AS G
    JOIN (
        SELECT
            B.genre AS genre,
            COUNT(B.id) AS GenreCount
        FROM
            public.book AS B
        GROUP BY
            B.genre
        HAVING
            COUNT(B.id) >= 100
    ) AS R ON R.genre = G.id;