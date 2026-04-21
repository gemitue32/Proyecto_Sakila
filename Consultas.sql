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
	"title",
	"length"
FROM
	"film"
ORDER BY
	"length" asc;
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




