UPDATE
    public.reader
SET
    birthday = (
        SELECT
            to_timestamp(avg(extract(epoch from birthday)))::date AS avg_birthday
        FROM
            public.reader
    )
WHERE
    lastname = 'barinov'