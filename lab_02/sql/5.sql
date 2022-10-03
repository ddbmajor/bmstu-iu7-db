SELECT
  id,
  lastname,
  firstname,
  middlename
FROM
  public.reader
WHERE
  NOT EXISTS (
    SELECT
      C1.id
    FROM
      public.reader AS C1
      JOIN public.card AS C2 ON C1.card_id = C2.id
    WHERE
      C2.expire_date < (
        SELECT
          CURRENT_DATE
      )
  );