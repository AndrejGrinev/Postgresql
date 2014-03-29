/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION validation_email_trigger() RETURNS TRIGGER IMMUTABLE LANGUAGE 'plpgsql' AS
$_$
  BEGIN
    IF NOT acc.is_email_valid (new.value) THEN
      RAISE EXCEPTION '%', ws.perror_str(acc.const_error_email_validation(), 'value', NEW.value);
    END IF;
    RETURN NEW;
  END;
$_$;
SELECT pg_c('f', 'validation_email_trigger', 'Проверка валидности email');
