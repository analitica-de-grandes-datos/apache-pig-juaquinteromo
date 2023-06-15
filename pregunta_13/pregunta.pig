/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (num1:int, name:chararray, lastname:chararray, date:chararray, color:chararray, num2:int);
color_data = FOREACH data GENERATE color;
filtered_data = FILTER color_data BY (SUBSTRING(color,0,1) == 'b');
STORE filtered_data INTO 'output' USING PigStorage(',');