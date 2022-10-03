SELECT
  R.id,
  R.lastname,
  R.firstname,
  R.middlename,
  C2.expire_date,
  (
    SELECT
      TO_TIMESTAMP(AVG(EXTRACT(EPOCH from C1.expire_date)))::DATE
    FROM
      public.card AS C1
  ) AS AvgExpDate
FROM
  public.reader AS R
  JOIN public.card AS C2 ON R.card_id = C2.id;