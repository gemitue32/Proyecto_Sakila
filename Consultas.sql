/*2. Muestra los nombres de todas las películas con una clasificación por
edades de ‘R’.*/
SELECT
	"title",
	"rating"
FROM
	"film"
WHERE
	"rating" = 'R';
/*3.Encuentra los nombres de los actores que tengan un “actor_id” entre 30
y 40.*/
SELECT
	"first_name",
	"actor_id"
FROM
	"actor"
WHERE
	"actor_id" between 30 and 40;
--4. Obtén las películas cuyo idioma coincide con el idioma original.
SELECT
	"title",
	"language_id",
	"original_language_id"
FROM
	"film"
WHERE
	"language_id" = "original_language_id";
--5. Ordena las películas por duración de forma ascendente.--
SELECT
	"title"
FROM
	"film"
ORDER BY
	"length" ASC;
/*6.Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su 
apellido.*/

SELECT
	"first_name",
	"last_name"
FROM
	"actor"
WHERE
	"last_name" ilike '%Allen%';

/*7. Encuentra la cantidad total de películas en cada clasificación de la tabla
“film” y muestra la clasificación junto con el recuento.*/

SELECT
	"rating",
	count(*)
FROM
	"film"
GROUP BY
	"rating";

/*8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una
duración mayor a 3 horas en la tabla film.*/

SELECT
	"title", 
	"rating",
	"length"
FROM 
	"film"
WHERE 
	"rating" = 'PG-13'OR "length" > 180;

--9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

SELECT 
    ROUND(VARIANCE("replacement_cost"), 2) AS "varianza_reemplazo",
    ROUND(STDDEV("replacement_cost"), 2) AS "desviacion_estandar_reemplazo"
FROM 
    "film";

--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

SELECT 
	MIN("length") as "duracion_minima",
	MAX("length") as "duracion_maxima"
FROM
	"film";

--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

SELECT 
	"amount", 
	"payment_date"
FROM 
	"payment"
ORDER BY 
	"payment_date" DESC
LIMIT 1 OFFSET 2;


/*12. Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC
17ʼ ni ‘Gʼ en cuanto a su clasificación*/



SELECT 
	"title"
FROM 
	"film"
WHERE "rating" NOT IN ('NC-17', 'G');

/*13. Encuentra el promedio de duración de las películas para cada 
clasificación de la tabla film y muestra la clasificación junto con el 
promedio de duración*/

SELECT 
	"rating",
	round(avg("length"), 2) AS "promedio_duracion"
FROM 
	"film"
GROUP BY 
	"rating"
ORDER BY 
	"promedio_duracion" DESC;

/*14.Encuentra el título de todas las películas que tengan una duración mayor 
a 180 minutos.*/

SELECT 
	"title"
FROM 
	"film"
WHERE 
	"length" > 180;

--15. ¿Cuánto dinero ha generado en total la empresa?

SELECT 
    SUM("amount") AS total_generado
FROM 
    "payment";










