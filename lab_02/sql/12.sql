SELECT
  'Самое скорое истечение' AS Criteria,
  id as "Читатель"
FROM
  public.reader AS R
  JOIN (
    SELECT
      id AS card_id_c
    FROM
      public.card
    WHERE expire_date = (
        SELECT MIN(expire_date)
        FROM public.card
    )
    LIMIT 1
  ) AS S1 ON R.card_id = S1.card_id_c
UNION
SELECT
  'Самое нескорое истечение' AS Criteria,
  id as "Читатель"
FROM
  public.reader AS R
  JOIN (
    SELECT
      id AS card_id_c
    FROM
      public.card
    WHERE expire_date = (
        SELECT MAX(expire_date)
        FROM public.card
    )
    LIMIT 1
  ) AS S1 ON R.card_id = S1.card_id_c;