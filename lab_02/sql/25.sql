SELECT
    genre,
    avg_year,
    min_year,
    max_year
FROM
    (
        SELECT
            B.genre,
            AVG(B.year) OVER (
                PARTITION BY
                    B.genre
            ) AS avg_year,
            MIN(B.year) OVER (
                PARTITION BY
                    B.genre
            ) AS min_year,
            MAX(B.year) OVER (
                PARTITION BY
                    B.genre
            ) AS max_year,
            ROW_NUMBER() OVER (
                PARTITION BY
                    B.genre
            ) AS RowNumber
        FROM
            public.book AS B
    ) AS Result
WHERE RowNumber = 1;