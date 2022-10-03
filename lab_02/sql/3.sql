SELECT DISTINCT
  C1.name
FROM
  public.book AS C1
  JOIN public.genre AS C2 ON C1.genre = C2.id
WHERE
  C2.name LIKE '%мат%'
ORDER BY
  C1.name;