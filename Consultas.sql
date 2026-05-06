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

SELECT
	CONCAT("c"."first_name", ' ', "c"."last_name" ) AS "clientes",
	"r"."rental_date",
	"r"."rental_id"
FROM 
	"customer" AS "c"
INNER JOIN "rental" AS r ON "c"."customer_id" = "r"."customer_id"
ORDER BY 
	"rental_date" DESC;

/*43.Muestra todos los clientes y sus alquileres si existen, incluyendo 
aquellos que no tienen alquileres.*/

SELECT
	CONCAT("c"."first_name", ' ', "c"."last_name" ) AS "clientes",
	"r"."rental_date",
	"r"."rental_id"
FROM 
	"customer" AS "c"
LEFT JOIN "rental" AS r ON "c"."customer_id" = "r"."customer_id"
ORDER BY
	"rental_date" DESC;


/*44.Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor 
esta consulta? ¿Por qué? Deja después de la consulta la contestación.*/



SELECT 
    "f"."title" AS "pelicula",
    "c"."name" AS "categoria"    
FROM 
    "film" AS "f"
CROSS JOIN "category" AS "c";

/*¿Aporta valor esta consulta?
No, en este contexto práctico no aporta valor real.

¿Por qué?

Un CROSS JOIN realiza un producto cartesiano, lo que significa que empareja cada película 
con todas las categorías existentes. El resultado muestra, por ejemplo, 
una película de terror clasificada como "Comedia", "Infantil" y "Documental", 
lo que genera información errónea para la toma de decisiones.


Si tienes 1,000 películas y 16 categorías, obtendrás 16,000 filas de las cuales el 93% serán asociaciones falsas. */

/*45.Encuentra los actores que han participado en películas de la categoría 
'Action'.*/

SELECT DISTINCT
    CONCAT("a"."first_name", ' ', "a"."last_name") AS "actor"
FROM 
    "actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
INNER JOIN "film" AS "f" ON "fa"."film_id" = "f"."film_id"
INNER JOIN "film_category" AS "fc" ON "f"."film_id" = "fc"."film_id"
INNER JOIN "category" AS "c" ON "fc"."category_id" = "c"."category_id"
WHERE
    "c"."name" = 'Action';


	


--46.Encuentra todos los actores que no han participado en películas.

SELECT 
    "a"."first_name",
    "a"."last_name"
FROM 
    "actor" AS "a"
WHERE NOT EXISTS (
    SELECT 1 
    FROM "film_actor" AS "fa" 
    WHERE "fa"."actor_id" = "a"."actor_id"
);





	

/*47.Selecciona el nombre de los actores y la cantidad de películas en las 
que han participado.*/

SELECT 
	"a"."first_name",
	"a"."last_name",
	COUNT("fa"."film_id") AS "total_peliculas"
FROM
	"actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
GROUP BY 
	"a"."actor_id", "a"."first_name", "a"."last_name"
ORDER BY
	COUNT("fa"."film_id") DESC;



/*48.Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres 
de los actores y el número de películas en las que han participado.*/

CREATE VIEW "actor_num_peliculas" AS
SELECT
    "a"."first_name",
    "a"."last_name",
    COUNT("fa"."film_id") AS "numero_peliculas"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
GROUP BY 
    "a"."actor_id", "a"."first_name", "a"."last_name";

-- Para consultar la vista:
SELECT * 
FROM "actor_num_peliculas";
	


--49.Calcula el número total de alquileres realizados por cada cliente.



select 
	"c"."first_name",
	"c"."last_name",
	count("r"."rental_id") as "total_alquileres"
from
	"customer" as "c"
inner join "rental" as "r" on "c"."customer_id" = "r"."customer_id"
group by
	"c"."customer_id", "c"."first_name", "c"."last_name"
	
order by
	"total_alquileres" desc;
	




--50.Calcula la duración total de las películas en la categoría 'Action'.

select 
	"c"."name" as "categoria",
	sum("f"."length") as "duracion_total"
from
	"film" as "f"
inner join "film_category" as "fc" on "f"."film_id" = "fc"."film_id"
inner join "category" as "c" on "fc"."category_id" = "c"."category_id"
where
	"c"."name" = 'Action'
group by 
	"c"."name";

/*51.Crea una tabla temporal llamada “cliente_rentas_temporalˮ para 
almacenar el total de alquileres por cliente.*/

CREATE TEMPORARY TABLE "cliente_rentas_temporal" AS

SELECT 
	"c"."first_name",
	"c"."last_name",
	COUNT("r"."rental_id") AS "total_alquileres"
FROM
	"customer" AS "c"
INNER JOIN "rental" AS "r" ON "c"."customer_id" = "r"."customer_id"
GROUP BY
	"c"."customer_id", "c"."first_name", "c"."last_name"
	
ORDER BY
	"total_alquileres" DESC;

SELECT *
FROM "cliente_rentas_temporal";

/*52.Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las 
películas que han sido alquiladas al menos 10 veces*/

CREATE TEMPORARY table "peliculas_alquiladas" AS
SELECT
	"f"."title",
	COUNT("r"."rental_id") AS "total_alquiler"
FROM 
	"film" AS "f"
INNER JOIN "inventory" AS "i" ON "f"."film_id" = "i"."film_id"
INNER JOIN "rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
GROUP BY
	"f"."title"
HAVING
	COUNT("r"."rental_id") >= 10;

SELECT*
FROM "peliculas_alquiladas";

/*53.Encuentra el título de las películas que han sido alquiladas por el cliente 
con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. Ordena 
los resultados alfabéticamente por título de película.*/
SELECT
	"f"."title",
	"c"."first_name",
	"c"."last_name"
FROM
	"film" AS "f"
INNER JOIN "inventory" AS "i" ON "f"."film_id" = "i"."film_id"
INNER JOIN "rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
INNER JOIN "customer" AS "c" ON "r"."customer_id" = "c"."customer_id"
WHERE return_date IS NULL AND first_name = 'TAMMY' AND last_name = 'SANDERS'
ORDER BY 
	"f"."title" ASC;

/*54.Encuentra los nombres de los actores que han actuado en al menos una 
película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados 
alfabéticamente por apellido.*/

SELECT DISTINCT 
	"a"."first_name",
	"a"."last_name"
FROM 
	"actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
INNER JOIN "film_category" AS "fc" ON "fa"."film_id" = "fc"."film_id"
INNER JOIN "category" AS "c" ON "fc"."category_id" = "c"."category_id"
WHERE "c"."name" = 'Sci-Fi'
ORDER BY 
	"a"."last_name" ASC;

/*55.Encuentra el nombre y apellido de los actores que han actuado en 
películas que se alquilaron después de que la película ‘Spartacus 
Cheaperʼ se alquilara por primera vez. Ordena los resultados 
alfabéticamente por apellido*/

SELECT DISTINCT 
    "a"."first_name", 
    "a"."last_name"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa" ON "a"."actor_id" = "fa"."actor_id"
INNER JOIN "inventory" AS "i" ON "fa"."film_id" = "i"."film_id"
INNER JOIN "rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
WHERE "r"."rental_date" > (
    -- Esta subconsulta solo calcula la fecha mínima de 'Spartacus Cheaper'
    SELECT MIN("r2"."rental_date")
    FROM "rental" AS "r2"
    INNER JOIN "inventory" AS "i2" ON "r2"."inventory_id" = "i2"."inventory_id"
    INNER JOIN "film" AS "f2" ON "i2"."film_id" = "f2"."film_id"
    WHERE "f2"."title" = 'SPARTACUS CHEAPER'
)
ORDER BY "a"."last_name" ASC;
	
/*56. Encuentra el nombre y apellido de los actores que no han actuado en 
ninguna película de la categoría ‘Musicʼ*/

SELECT 
    "a"."first_name", 
    "a"."last_name"
FROM 
    "actor" AS "a"
WHERE NOT EXISTS (
    SELECT 1
    FROM "film_actor" AS "fa"
    INNER JOIN "film_category" AS "fc" ON "fa"."film_id" = "fc"."film_id"
    INNER JOIN "category" AS "c" ON "fc"."category_id" = "c"."category_id"
    WHERE "fa"."actor_id" = "a"."actor_id" 
      AND "c"."name" = 'Music'
);

--57. Encuentra el título de todas las películas que fueron alquiladas por más
de 8 días.*/

SELECT DISTINCT
    "f"."title"
FROM "film" AS "f"
INNER JOIN "inventory" AS "i" ON "f"."film_id" = "i"."film_id"
INNER JOIN "rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
WHERE ("r"."return_date" - "r"."rental_date") > INTERVAL '8 days';

/*58. Encuentra el título de todas las películas que son de la misma categoría
que ‘Animation’.*/

SELECT
	"f"."title"
FROM
	"film" AS "f"
INNER JOIN "film_category" AS "fc" ON "f"."film_id" = "fc"."film_id"
WHERE "fc"."category_id" = (
	SELECT
		"c"."category_id"
	FROM
		"category" as "c"
	WHERE "c"."name" = 'Animation'

);

/*59. Encuentra los nombres de las películas que tienen la misma duración
que la película con el título ‘Dancing Fever’. Ordena los resultados
alfabéticamente por título de película.*/

SELECT 
	"title"
FROM 
	"film"
WHERE "length" = (
	SELECT 
		"length"
	FROM 
		"film"
	WHERE "title" = 'DANCING FEVER'


)
ORDER BY "title" ASC;




/*60. Encuentra los nombres de los clientes que han alquilado al menos 7
películas distintas. Ordena los resultados alfabéticamente por apellido.*/

SELECT 
	"c"."first_name",
	"c"."last_name",
	COUNT(DISTINCT "f"."title") AS "numero_peliculas"
FROM 
	"customer" AS "c"
INNER JOIN "rental" AS "r" ON "c"."customer_id" = "r"."customer_id"
INNER JOIN "inventory" AS "i" ON "r"."inventory_id" = "i"."inventory_id"
INNER JOIN "film" AS "f" ON "i"."film_id" = "f"."film_id"
GROUP BY 
	"c"."first_name",
	"c"."last_name"
HAVING
	COUNT(DISTINCT "f"."title") >= 7
ORDER BY "c"."last_name" ASC;

*/61. Encuentra la cantidad total de películas alquiladas por categoría y
muestra el nombre de la categoría junto con el recuento de alquileres.*/

SELECT
	"c"."name" AS "categoria",
	COUNT("r"."rental_id") AS "recuento_alquileres"
FROM 
	"category" AS "c"
INNER JOIN "film_category" AS "fc" ON "c"."category_id" = "fc"."category_id"
INNER JOIN "inventory" AS "i" ON "fc"."film_id" = "i"."film_id"
INNER JOIN "rental" AS "r" ON "i"."inventory_id" = "r"."inventory_id"
GROUP BY 
	"c"."name";
	
	
	
	
	




	




	





	





	
	





















