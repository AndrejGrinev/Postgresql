/* ------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION is_email_valid (a_value text) returns BOOLEAN stable language 'sql' AS
$_$
  -- a_value: проверяемое значение
  SELECT $1 ~ E'(^(([^<>()[\\]\\.,;:\\s@\"]+(\\.[^<>()[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z0-9]{1,})$)';
$_$;
SELECT pg_c('f', 'is_email_valid', 'Валидация емайл');
