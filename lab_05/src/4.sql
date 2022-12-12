DROP FUNCTION IF EXISTS is_key(json_to_check JSONB, key TEXT);

CREATE OR REPLACE FUNCTION is_key(json_to_check JSONB, key TEXT)
RETURNS BOOLEAN
AS $$
BEGIN
    RETURN json_to_check->key IS NOT NULL;
END;
$$ LANGUAGE PLPGSQL;

-- Корректный случай
SELECT is_key('{"employee": "mark"}', 'employee');
-- Некорректный случай
SELECT is_key('{"salary": 13}', 'employee');


-- Пункт 4
DROP TABLE IF EXISTS JsonDoc1, JsonDoc2;

CREATE TEMP TABLE IF NOT EXISTS JsonDoc1
(
    data JSONB
);
CREATE TEMP TABLE IF NOT EXISTS JsonDoc2
(
    data JSONB
);

\copy JsonDoc1(data) FROM 'datasets/cards.json';
\copy JsonDoc2(data) FROM 'datasets/readers.json';

UPDATE
    JsonDoc1
SET 
    data = jd2.data
FROM
    JsonDoc2 jd2;

SELECT * FROM JsonDoc1;

Пункт 5
SELECT *
FROM jsonb_array_elements
(
    '[
    {"employee": "Mark", "salary": 123},
    {"employee": "Linis", "salary": 1234556}
    ]'
);