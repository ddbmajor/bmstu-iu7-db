drop table if exists public.type;
create table public.type(
    name TEXT primary key,
);

COPY public.type FROM '/home/ddbmajor/VUZ/bmstu-iu7-db/lab_01/csv/types.csv'
DELIMITER ','
CSV
HEADER
;