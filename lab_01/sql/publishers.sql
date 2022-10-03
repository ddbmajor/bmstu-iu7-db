drop table if exists public.publisher;
create table public.publisher(
    id INT primary key,
    name TEXT,
    country TEXT,
    city TEXT
);

COPY public.publisher FROM '/home/ddbmajor/VUZ/bmstu-iu7-db/lab_01/csv/publishers.csv'
DELIMITER ','
CSV
HEADER
;