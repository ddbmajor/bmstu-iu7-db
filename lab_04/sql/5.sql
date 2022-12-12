CREATE OR REPLACE FUNCTION readerUpdateLog()
RETURNS TRIGGER
AS $$
    plpy.notice(f"The {TD['new']['id']} reader has been updated");
$$ LANGUAGE PLPYTHON3U;

-- Создание триггера AFTER.
CREATE OR REPLACE TRIGGER readerUpdate
  AFTER UPDATE
  ON public.reader
  FOR EACH ROW
  EXECUTE PROCEDURE readerUpdateLog();
 
UPDATE public.reader
SET firstname = 'MISHA' WHERE id = 7;