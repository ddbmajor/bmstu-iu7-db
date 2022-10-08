SELECT
  id
FROM
  public.card AS C
WHERE
  id = (
    SELECT
      card_id
    FROM
      public.reader AS R
    WHERE
      R.id = (
        SELECT
          B.reader
        FROM
          public.book AS B
        WHERE
          B.id = 2
      )
  );