## Proyecto Sakila: Análisis de Base de Datos

### Sobre el proyecto
He usado la base de datos de Sakila para practicar consultas SQL en DBeaver. El objetivo es extraer información útil sobre el inventario de películas, los actores y el comportamiento de los alquileres.

### Herramientas
* **DBeaver** (Gestor de base de datos)
* **PostgreSQL**
* **GitHub Desktop** (Control de versiones)

---

## Informe de Análisis

### Consulta 2: Películas para adultos
He filtrado el catálogo para obtener solo las películas con clasificación **'R'**. Esto sirve para identificar el contenido que requiere supervisión.

---

### Consulta 3: IDs de actores
Saqué un listado de los actores que tienen un ID entre el **30 y el 40**. Es una consulta útil para buscar rangos específicos de registros.

---

### Consulta 4: Error en idiomas
Al intentar comparar el idioma original con el actual, me di cuenta de que la columna `original_language_id` está vacía en todas las películas. Por ahora, no se puede hacer este análisis hasta que se completen los datos.

---

### Consulta 5: Películas largas y cortas
He ordenado el catálogo por duración. Las películas más rápidas de ver duran **46 minutos** y las más largas llegan a las **3 horas y 5 minutos** (185 min).

---

### Consulta 6: Apellido Allen
Busqué a todos los actores que se apellidan **Allen**. Salieron 3 resultados: Cuba, Kim y Meryl. 

---

### Consulta 7: Inventario por edades
Conté cuántas películas hay de cada tipo. La mayoría son **PG-13** (223), mientras que de la categoría **G** (apta para todos) hay menos cantidad (178). El resto están bastante repartidas.

---

### Consulta 8: Filtro especial
Hice una lista de películas que o bien son **PG-13** o duran más de **3 horas**. Es un filtro combinado para encontrar películas largas o de una categoría específica.

---

### Consulta 9: Variabilidad de precios
Calculé cuánto varían los precios de reemplazo de los DVDs. El costo suele estar alrededor de los 20€, pero hay una **variabilidad (desviación) de unos 6€** arriba o abajo dependiendo de la película.

---

###Consulta 10: Valores extremos de duración
He calculado directamente la duración mínima y máxima de las películas del inventario. La película más corta dura 46 minutos y la más larga 185 minutos. Esto confirma los datos obtenidos anteriormente mediante ordenación.

---

###Consulta 11: El antepenúltimo pago
Para averiguar el coste del antepenúltimo alquiler, he consultado la tabla payment ordenando por fecha de forma descendente. Al aplicar un OFFSET 2, saltamos los dos últimos registros para obtener exactamente el valor del tercero. El importe fue de 0,99.

----

###Consulta 12: Filtrado de clasificaciones
He generado un listado de títulos excluyendo las categorías 'NC-17' (solo adultos) y 'G' (todos los públicos). 

---

###Consulta 13: Duración media por categoría
He calculado el promedio de duración para cada clasificación de edad. Es interesante ver cómo varían los tiempos: por ejemplo, las películas de una categoría específica suelen ser más largas que otras. He redondeado el resultado a dos decimales para que el análisis sea más limpio.

---

Consulta 14: Películas de larga duración
He filtrado el catálogo para localizar los títulos que superan las 3 horas (180 minutos). 

---

Consulta 15: Ingresos totales
He calculado la suma de todos los pagos registrados en la tabla payment. La empresa ha generado un total de 67.416,51€ . Este dato representa la facturación bruta histórica de la plataforma.

---

Consulta 16: Clientes más recientes
He obtenido el nombre de los 10 clientes con el ID más alto. Suele servir para identificar a los últimos usuarios que se han dado de alta en la plataforma.

---

Consulta 17: Relación Actor-Película
He localizado a los actores que participan en 'Egg Igby'. Para lograrlo, ha sido necesario conectar tres tablas distintas (actor, film_actor y film), ya que la relación entre actores y películas es de muchos a muchos. Este es mi primer uso de un JOIN múltiple para cruzar datos complejos.

---

Consulta 18: Listado de títulos únicos
He obtenido la lista de todos los títulos de películas del catálogo. He utilizado la cláusula DISTINCT para garantizar que no aparezcan nombres duplicados en el resultado final, asegurando una lista limpia de títulos únicos.

---

Consulta 19: Comedias de larga duración
He identificado las películas de género 'Comedy' que superan los 180 minutos. Tras realizar el cruce de tablas entre film, film_category y category, los resultados obtenidos son: CONTROL ANTHEM, SATURN NAME, SEARCHERS WAIT. Esto demuestra que el catálogo contiene producciones de comedia con una extensión poco habitual (más de 3 horas).

---

Consulta 20: Categorías de larga duración
En este ejercicio, he combinado JOINs, GROUP BY y HAVING. El objetivo era identificar qué géneros de películas tienen, de media, una duración superior a los 110 minutos. 