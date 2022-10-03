SELECT
  id,
  name
FROM
  public.book
WHERE
  publisher <> ALL (
    SELECT
      id
    FROM
      public.publisher
    WHERE
      country <> 'Китай'
  );