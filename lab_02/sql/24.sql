SELECT
    B.id,
    B.name,
    B.year,
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
    ) AS max_year
FROM
    public.book AS B;