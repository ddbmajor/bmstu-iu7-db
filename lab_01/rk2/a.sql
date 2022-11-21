drop table if exists public.meal;
create table public.meal(
	id INT primary key,
	name VARCHAR(20) NOT NULL
);

INSERT INTO meal
VALUES (1, 'завтрак'),
		(2, 'обед'),
		(3, 'ужин');

drop table if exists public.menu;
create table public.menu(
    id INT primary key,
    name TEXT NOT NULL,
    meal INT references meal(id) ON DELETE RESTRICT NOT NULL,
    description TEXT
);

INSERT INTO menu VALUES
(1, 'one', 1, 'asd asd asd'),
(2, 'two', 2, 'asd efdv asd'),
(3, 'eafd', 3, 'asdef rvf'),
(4, 'sdc', 1, 'asd ef'),
(5, 'rb', 2, 'asdyukd'),
(6, 'uik', 3, 'asd wqef'),
(7, 'ewd', 1, 'wdev'),
(8, 'hm', 2, 'qqqqqqq'),
(9, 'qwef', 3, 'asff'),
(10, 'mj', 1, 'aswff');

drop table if exists public.dish_menu;
create table public.dish_menu(
    dish_id INT references dish(id),
	menu_id INT references menu(id),
	PRIMARY KEY (dish_id, menu_id)
);

INSERT INTO dish_menu VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(4, 2),
(8, 3),
(9, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


drop table if exists public.dish;
create table public.dish(
    id INT primary key,
    name TEXT NOT NULL,
    description TEXT,
	rating FLOAT
);

INSERT INTO dish VALUES
(1, 'one','asd asd asd', 1.4),
(2, 'two', 'asd efdv asd', 2),
(3, 'eafd', 'asdef rvf', 4),
(4, 'sdc', 'asd ef', 4.3),
(5, 'rb', 'asdyukd', 4.6),
(6, 'uik', 'asd wqef', 4),
(7, 'ewd', 'wdev', 4.8),
(8, 'hm', 'qqqqqqq', 4.8),
(9, 'qwef', 'asff', 4.1),
(10, 'mj', 'aswff', 4.3);

drop table if exists public.dish_product;
create table public.dish_product(
    dish_id INT references dish(id),
	product_id INT references product(id),
	PRIMARY KEY (dish_id, product_id)
);

INSERT INTO dish_product VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(4, 2),
(8, 3),
(9, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

drop table if exists public.product;
create table public.product(
    id INT primary key,
    name TEXT NOT NULL,
    date_of_produce DATE,
	shell_life INT,
	producer TEXT
);

INSERT INTO product VALUES
(1, 'one_product', '2022-11-19', 30, 'asd asd asd'),
(2, 'two_product', '2022-11-19', 30, 'asd efdv asd'),
(3, 'eafd_product', '2022-11-19', 30, 'asdef rvf'),
(4, 'sdc_product', '2022-11-19', 30, 'asd ef'),
(5, 'rb_product', '2022-11-19', 30, 'asdyukd'),
(6, 'uik_product', '2022-11-19', 30, 'asd wqef'),
(7, 'ewd_product', '2022-11-19', 30, 'wdev'),
(8, 'hm_product', '2022-11-19', 30, 'qqqqqqq'),
(9, 'qwef_product', '2022-11-19', 30, 'asff'),
(10, 'mj_product', '2022-11-19', 30, 'aswff');

-- Запрос достает блюдо с самым высоким рейтингом
SELECT * FROM dish
WHERE rating >= ALL (SELECT rating FROM dish);

-- Запрос достает блюдо с самым высоким рейтингом
SELECT * from dish
WHERE rating = (SELECT MAX(rating)
			   FROM dish);
			   
-- Запрос достает кол-во блюд в первом меню(второй вариант решения 2.2)		
SELECT count(dish_id)
FROM dish_menu
WHERE menu_id = 1;

-- Создает временную локальную таблицу блюд с самым высоким рейтингом
SELECT * 
INTO tmp
from dish
WHERE rating = (SELECT MAX(rating)
			   FROM dish);

--Хранимая процедура
