INSERT INTO
    public.card (
        id,
        reg_date,
        expire_date
    )
VALUES
    ((SELECT MAX(id)+1 FROM public.card), '2022-10-08', '2024-01-01');