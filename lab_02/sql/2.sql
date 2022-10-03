SELECT DISTINCT
  C.id,
  C.expire_date
FROM
  public.card AS C
WHERE
  C.expire_date BETWEEN '2022-10-20' AND '2022-10-20';