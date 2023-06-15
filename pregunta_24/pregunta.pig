/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


data = LOAD 'data.csv' USING PigStorage(',') AS (num1:int, name:chararray, lastname:chararray, date:chararray, color:chararray, num2:int);
datos = FOREACH data GENERATE date;
filtered_data = FOREACH datos GENERATE SUBSTRING(date, 5, 7) AS extracted_date;
STORE filtered_data INTO 'output' USING PigStorage(',');