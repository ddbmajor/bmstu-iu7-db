DELETE FROM
    public.reader
WHERE
    card_id IN (
        SELECT
            id
        FROM
            public.card
        WHERE
            expire_date < NOW()
    );