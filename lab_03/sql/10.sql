CREATE OR REPLACE VIEW
    dolzniki AS
SELECT DISTINCT
    r.id, r.firstname
FROM
    public.book AS b
    JOIN public.reader AS r ON b.reader = r.id;

CREATE OR REPLACE FUNCTION log_instead_update() RETURNS TRIGGER
AS $log_instead_update$
    BEGIN
        RAISE NOTICE '!!!!Do not update dolznik % to %!!!!', old.id, new.id;
        RETURN old;
    END
$log_instead_update$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER do_not_delete_dolznik 
INSTEAD OF UPDATE ON public.dolzniki
FOR EACH ROW
EXECUTE PROCEDURE log_instead_update();


-- SELECT * from dolzniki;

UPDATE dolzniki
SET firstname = 'Вася'
WHERE id = 26;