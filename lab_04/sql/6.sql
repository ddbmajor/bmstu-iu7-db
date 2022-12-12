DROP FUNCTION IF EXISTS getReaderCard(name VARCHAR, card_id INT);
DROP TYPE IF EXISTS tmptype;

CREATE TYPE tmptype AS (
    reader_name    VARCHAR,
    card_id    INT
);

CREATE OR REPLACE FUNCTION getReaderCard(name VARCHAR, card_id INT)
RETURNS SETOF tmptype
AS $$
    return ([name, card_id],)
$$ LANGUAGE PLPYTHON3U;

SELECT *
FROM getReaderCard('grisha', 56);