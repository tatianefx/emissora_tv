CREATE OR REPLACE FUNCTION trigger_jornalista()
RETURNS trigger AS $$
BEGIN
  IF(new.CODIGO_JOR IN (SELECT CODIGO_ART FROM ARTISTA) OR
     new.CODIGO_JOR IN (SELECT CODIGO_TEC FROM TECNICO))
    THEN RAISE NOTICE 'Funcionário já possui especialização';
    RETURN NULL;
  ELSE
    RETURN NEW;
  END IF;


END $$ language 'plpgsql';


CREATE TRIGGER antes_insere_jornalista
BEFORE INSERT ON JORNALISTA
FOR EACH ROW
EXECUTE PROCEDURE trigger_jornalista();