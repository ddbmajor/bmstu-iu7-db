drop table if exists public.card;
create table public.card(
    id INT primary key,
    reg_date DATE,
    expire_date DATE,
);

COPY public.card FROM '/home/ddbmajor/VUZ/bmstu-iu7-db/lab_01/csv/cards.csv'
DELIMITER ','
CSV
HEADER
;