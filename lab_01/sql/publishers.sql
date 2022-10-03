drop table if exists public.publisher;
create table public.publisher(
    id INT primary key,
    name TEXT,
    country TEXT,
    city TEXT
);

COPY public.publisher FROM '/tmp/lab01/csv/publishers.csv'
DELIMITER ','
CSV
HEADER
;