SELECT
  AVG(books_owned) AS "Actual AVG",
  SUM(books_owned) / COUNT(reader) AS "Calc AVG"
FROM
  (
    SELECT
      reader,
      COUNT(id) AS books_owned
    FROM
      public.book
    GROUP BY
      reader
  ) AS books_on_reader;