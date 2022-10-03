SELECT
  R.id,
  R.lastname,
  R.firstname,
  R.middlename,
  CASE
    WHEN DATE_PART('day', C.expire_date - NOW()) < 7 THEN 'Cкоро'
    WHEN DATE_PART('day', C.expire_date - NOW()) < 14 THEN 'Приемлимо'
    ELSE 'Не скоро'
  END AS "Истекает"
FROM
  public.reader AS R
  JOIN public.card AS C ON R.card_id = C.id
WHERE
  EXTRACT(MONTH from C.expire_date) = EXTRACT(MONTH from NOW());