CREATE OR REPLACE PROCEDURE public.updateReaderName(id INT, name VARCHAR(30))
AS $$
    query = plpy.prepare(
            "UPDATE public.reader SET firstname = $2 WHERE id = $1;",
            ["INT", "VARCHAR(30)"]
        )

    plpy.execute(query, [id, name])
$$ LANGUAGE PLPYTHON3U;

CALL public.updateReaderName(7, 'Roma');