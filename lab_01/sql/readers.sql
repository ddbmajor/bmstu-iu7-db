drop table if exists public.reader;
create table public.reader(
    id INT primary key,
    lastname TEXT,
    firstname TEXT,
    middlename TEXT,
    birthday DATE,
    card_id INT references card(id)
);

COPY public.reader FROM '/home/ddbmajor/VUZ/bmstu-iu7-db/lab_01/csv/readers.csv'
DELIMITER ','
CSV
HEADER
;