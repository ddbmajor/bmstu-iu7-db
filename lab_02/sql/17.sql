INSERT INTO
    public.reader (
        id,
        lastname,
        firstname,
        middlename,
        birthday,
        card_id 
    )
VALUES
    ((SELECT MAX(id)+1 FROM public.reader), 'barinov', 'nikita', 'yuryevich', '2002-05-20', (SELECT MAX(id) FROM public.card));