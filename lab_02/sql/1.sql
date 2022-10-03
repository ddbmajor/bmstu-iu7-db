SELECT DISTINCT
  C1.id,
  C1.name
FROM
  public.book AS C1
  JOIN public.genre AS C2 ON C1.genre = C2.id
WHERE
  C1.year > 2015
  AND C2.name = 'Вузовская'
ORDER BY
  C1.name,
  C1.id;