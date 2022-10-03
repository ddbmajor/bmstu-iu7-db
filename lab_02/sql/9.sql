SELECT
  R.id,
  R.lastname,
  R.firstname,
  R.middlename,
  CASE
    EXTRACT(DAY from C.expire_date)
    WHEN EXTRACT(DAY from NOW()) THEN 'Сегодня'
    WHEN EXTRACT(DAY from NOW()) + 1 THEN 'Завтра'
    ELSE CONCAT('Через ', CAST(
      DATE_PART('day', C.expire_date - NOW()) AS varchar(5)
    ), ' дня/дней')
  END AS "Истекает"
FROM
  public.reader AS R
  JOIN public.card AS C ON R.card_id = C.id
WHERE
  EXTRACT(MONTH from C.expire_date) = EXTRACT(MONTH from NOW());