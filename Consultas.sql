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

--16. Muestra los 10 clientes con mayor valor de id.



select 
	concat("first_name", ' ', "last_name") as "cliente"
from
	"customer"
order by 
	"customer_id" desc
limit 
	10;

/*17. Encuentra el nombre y apellido de los actores que aparecen en la 
película con título ‘Egg Igbyʼ.*/



SELECT 
    a.first_name, 
    a.last_name
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
WHERE f.title = 'EGG IGBY';
		

--18. Selecciona todos los nombres de las películas únicos.



SELECT 
	DISTINCT "title"
FROM
	"film";


/*19. Encuentra el título de las películas que son comedias y tienen una
duración mayor a 180 minutos en la tabla “film”.*/


SELECT 
	"f"."title"
FROM
	"film" AS "f"
INNER JOIN "film_category" AS "fc" ON "f"."film_id" = "fc"."film_id"
INNER JOIN "category" AS "c" ON "fc"."category_id" = "c"."category_id"
WHERE
	"c"."name" = 'Comedy' AND "f"."length" > 180;

/*20. Encuentra las categorías de películas que tienen un promedio de
duración superior a 110 minutos y muestra el nombre de la categoría
junto con el promedio de duración.*/

SELECT 
	"c"."name" AS "categoria",
	ROUND(AVG("f"."length"), 2) AS "promedio"
FROM
	"category" AS "c"
INNER JOIN "film_category" AS "fc" ON c.category_id = fc.category_id 
INNER JOIN "film" AS "f" ON "fc"."film_id" = "f"."film_id"
GROUP BY 
	"c"."name"
HAVING 
	AVG("f"."length") > 110;

--21. ¿Cuál es la media de duración del alquiler de las películas?

SELECT 
    ROUND(AVG(rental_duration), 2) AS media
FROM 
    public.film;

/*22. Crea una columna con el nombre y apellidos de todos los actores y
actrices.*/

SELECT 
	concat("first_name", ' ', "last_name") AS "nombre_completo"
FROM "actor";

/*23. Números de alquiler por día, ordenados por cantidad de alquiler de
forma descendente.*/


SELECT 
	DATE("rental_date") AS "fecha",
	COUNT(*) AS "total_dias"
FROM
	"rental"
GROUP BY 
	"fecha"
ORDER BY 
	"total_dias" desc;

--24. Encuentra las películas con una duración superior al promedio.

SELECT 
	"title" as "pelicula",
	"length" as "duracion"
FROM "film"
WHERE
	"length" > (
		SELECT AVG("length") as "promedio"
		FROM "film"
	
	
	);
	
--25. Averigua el número de alquileres registrados por mes.
	
SELECT 
	TO_CHAR("rental_date", 'YYYY-Month') AS "mes",
	COUNT(*) AS "total_alquileres"
FROM
	"rental"
GROUP BY
	"mes"
ORDER BY 
	"mes";

/*26. Encuentra el promedio, la desviación estándar y varianza del total
pagado.*/


SELECT 
	ROUND(AVG("amount"), 2) AS "promedio",
	ROUND(STDDEV("amount"), 2) AS "desviacion",
	ROUND(VARIANCE("amount"), 2) AS "varianza"
FROM 
	"payment";


	
--27. ¿Qué películas se alquilan por encima del precio medio?

select *
from "film";

select 
	"title",
	"rental_rate"
from 
	"film"
where "rental_rate" > (
		select 
			round(avg("rental_rate"), 2) as "precio_medio"
		from
			"film"


);

/*28. Muestra el id de los actores que hayan participado en más de 40
películas.*/

SELECT 
	"actor_id",
	count("film_id")
FROM 
	"film_actor"
GROUP BY
	"actor_id"
HAVING
	count("film_id") > 40;

/*29. Obtener todas las películas y, si están disponibles en el inventario,
mostrar la cantidad disponible.*/

SELECT 
	"f"."title" AS "pelicula",
	COUNT("i"."store_id") AS "cantidad_disponible"
FROM 
	"film" AS "f"
LEFT JOIN "inventory" AS "i" ON "f".film_id = "i".film_id
group by
	"f"."title"
order by 
	"cantidad_disponible" DESC;
	
--30. Obtener los actores y el número de películas en las que ha actuado.	

SELECT 
	CONCAT("a"."first_name", ' ', "a"."last_name") AS "actores",
	COUNT("f"."film_id") AS "numero_peliculas"
FROM
	"actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON  "a".actor_id = "fa".actor_id
INNER JOIN "film" AS "f" ON "fa"."film_id" = "f"."film_id"
GROUP BY 
	CONCAT("a"."first_name", ' ', "a"."last_name")
ORDER BY
	"numero_peliculas" DESC;
	

/*31. Obtener todas las películas y mostrar los actores que han actuado en
ellas, incluso si algunas películas no tienen actores asociados.*/

SELECT 
    "f"."title" AS "pelicula",
    CONCAT("a"."first_name", ' ', "a"."last_name") AS "actor"
FROM 
    "film" AS "f"
LEFT JOIN 
    "film_actor" AS "fa" ON "f"."film_id" = "fa"."film_id"
LEFT JOIN 
    "actor" AS "a" ON "fa"."actor_id" = "a"."actor_id";

/*32. Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película.*/

SELECT 
    "f"."title" AS "pelicula",
    CONCAT("a"."first_name", ' ', "a"."last_name") AS "actor"
FROM 
    "actor" AS "a"
LEFT JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
LEFT JOIN "film" AS "f" ON "fa"."film_id" = "f"."film_id";




/*33. Obtener todas las películas que tenemos y todos los registros de
alquiler.*/

SELECT 
	"r"."rental_id" AS "ticket_alquiler",
	"f"."title" AS "pelicula",
	"r"."rental_date" AS "fecha_alquiler"
FROM
	"film" AS "f"
LEFT JOIN 
	"inventory" AS "i" ON "f"."film_id" = "i"."film_id"
LEFT JOIN 
	"rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
ORDER BY 
	"pelicula";


--34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

SELECT 
	CONCAT("c"."first_name", ' ' , "c"."last_name") AS "cliente",
	SUM("p"."amount") AS "importe_total"
FROM 
	"customer" AS "c"
INNER JOIN "payment" AS "p" ON "c"."customer_id" = "p"."customer_id"
GROUP BY 
	"cliente"
ORDER BY 
	"importe_total" DESC
LIMIT 5;


	

--35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.
SELECT 
	"first_name",
	"last_name"
FROM 
	"actor"
WHERE 
	"first_name" = 'JOHNNY'



/*36. Renombra la columna “first_name” como Nombre y “last_name” como
Apellido.*/
SELECT 
	"first_name" AS "Nombre",
	"last_name" AS "Apellido"
FROM 
	"actor";

--37. Encuentra el ID del actor más bajo y más alto en la tabla actor.

SELECT 
	MIN("actor_id"),
	MAX("actor_id")
FROM 
	"actor";
	
--38. Cuenta cuántos actores hay en la tabla “actor”.

SELECT 
	COUNT("actor_id")
FROM
	"actor";

/*39. Selecciona todos los actores y ordénalos por apellido en orden
ascendente.*/

SELECT 
	"first_name" AS "nombre",
	"last_name" AS "apellidos"
FROM 
	"actor"
ORDER BY
	"last_name" ASC;

--40. Selecciona las primeras 5 películas de la tabla “film”.

SELECT 
	"title"
FROM 
	"film"
ORDER BY 
	"title" ASC
LIMIT 5;

/*41.Agrupa los actores por su nombre y cuenta cuántos actores tienen el 
mismo nombre. ¿Cuál es el nombre más repetido?*/

SELECT 
	"first_name",
	count(*) AS "total"
FROM
	"actor"
GROUP BY 
	"first_name"
ORDER BY
	"total" DESC
LIMIT 1;

/*42.Encuentra todos los alquileres y los nombres de los clientes que los 
realizaron.*/


/*43.Muestra todos los clientes y sus alquileres si existen, incluyendo 
aquellos que no tienen alquileres.*/
/*44.Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor 
esta consulta? ¿Por qué? Deja después de la consulta la contestación.*/
/*45.Encuentra los actores que han participado en películas de la categoría 
'Action'.*/
--46.Encuentra todos los actores que no han participado en películas.
/*47.Selecciona el nombre de los actores y la cantidad de películas en las 
que han participado.*/
/*48.Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres 
de los actores y el número de películas en las que han participado.
--49.Calcula el número total de alquileres realizados por cada cliente.
--50.Calcula la duración total de las películas en la categoría 'Action'.
	
	





















