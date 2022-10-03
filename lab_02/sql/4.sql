SELECT
  id,
  name
FROM
  public.book
WHERE
  author IN (
    SELECT
      id
    FROM
      public.author
    WHERE
      country = 'Турция'
  );