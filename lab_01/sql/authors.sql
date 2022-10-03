drop table if exists public.author;
create table public.author(
    id INT primary key,
    lastname TEXT,
    firstname TEXT,
    middlename TEXT,
    birthday DATE,
    country TEXT
);

COPY public.author FROM '/tmp/lab01/csv/authors.csv'
DELIMITER ','
CSV
HEADER
;