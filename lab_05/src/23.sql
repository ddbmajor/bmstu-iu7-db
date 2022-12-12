DROP TABLE IF EXISTS CardsFromJson;

CREATE TEMP TABLE IF NOT EXISTS CardsFromJson
(
    id INT primary key,
    reg_date DATE,
    expire_date DATE
);

DROP TABLE IF EXISTS temp;

CREATE TEMP TABLE IF NOT EXISTS temp
(
    data JSONB
);

\copy temp(data) FROM 'datasets/cards.json';

INSERT INTO CardsFromJson (id, reg_date, expire_date)
SELECT (data->>'id')::INT, (data->>'reg_date')::DATE, (data->>'expire_date')::DATE
FROM temp;

SELECT * FROM CardsFromJson;
