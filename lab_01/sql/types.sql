drop table if exists public.type;
create table public.type(
    name TEXT primary key
);

COPY public.type FROM '/tmp/lab01/csv/types.csv'
DELIMITER ','
CSV
HEADER
;