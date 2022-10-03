drop table if exists public.book;
create table public.book(
    id INT primary key,
    name TEXT,
    author INT references author(id),
    year INT,
    genre INT references genre(id),
    publisher INT references publisher(id),
    reader INT references reader(id)
);

COPY public.book FROM '/tmp/lab01/csv/books.csv'
DELIMITER ','
CSV
HEADER
;