DROP TABLE IF EXISTS public.employee;
CREATE TABLE public.employee (
 id int PRIMARY KEY,
 firstname varchar(40) NOT NULL,
 lastname varchar(40) NOT NULL,
 title varchar(100) NOT NULL,
 DeptID smallint NOT NULL,
 ManagerID int NULL
);
-- Заполнение таблицы значениями.
INSERT INTO public.employee
VALUES 
    (1, 'Никита', 'Петров', 'Проджект менеджер',16, NULL),
    (2, 'Василий', 'Сидоров', 'Разработчик', 16, 1),
    (3, 'Давид', 'Щепкин', 'Стажер', 16, 2),
    (4, 'Серафим', 'Пупкин', 'Стажер', 16, 2);
-- Определение ОТВ
WITH RECURSIVE DirectReports (ManagerID, id, title, DeptID, Level) AS
(
 -- Определение закрепленного элемента
 SELECT e.ManagerID, e.id, e.title, e.DeptID, 0 AS Level
 FROM public.employee AS e
 WHERE ManagerID IS NULL
 UNION ALL
 -- Определение рекурсивного элемента
 SELECT e.ManagerID, e.id, e.title, e.DeptID, Level + 1
 FROM public.employee AS e INNER JOIN DirectReports AS d
 ON e.ManagerID = d.id
)
-- Инструкция, использующая ОТВ
SELECT ManagerID, id, title, DeptID, Level
FROM DirectReports; 