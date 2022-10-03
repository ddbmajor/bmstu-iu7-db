drop table if exists public.writer;
create table public.writer(
    id INT primary key,
    lastname TEXT,
    firstname TEXT,
    middlename TEXT,
    birthday DATE,
    country TEXT
);

COPY public.writer FROM '/home/ddbmajor/VUZ/bmstu-iu7-db/lab_01/csv/authors.csv'
DELIMITER ','
CSV
HEADER
;