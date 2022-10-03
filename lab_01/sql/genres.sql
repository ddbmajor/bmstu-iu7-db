drop table if exists public.genre;
create table public.genre(
    id INT primary key,
    type TEXT references type(name),
    name TEXT,
    description TEXT
);

COPY public.genre FROM '/tmp/lab01/csv/genres.csv'
DELIMITER ','
CSV
HEADER
;