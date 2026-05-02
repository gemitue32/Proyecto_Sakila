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

###Consulta 14: Películas de larga duración
He filtrado el catálogo para localizar los títulos que superan las 3 horas (180 minutos). 

---

###Consulta 15: Ingresos totales
He calculado la suma de todos los pagos registrados en la tabla payment. La empresa ha generado un total de 67.416,51€ . Este dato representa la facturación bruta histórica de la plataforma.

---

###Consulta 16: Clientes más recientes
He obtenido el nombre de los 10 clientes con el ID más alto. Suele servir para identificar a los últimos usuarios que se han dado de alta en la plataforma.

---

###Consulta 17: Relación Actor-Película
He localizado a los actores que participan en 'Egg Igby'. Para lograrlo, ha sido necesario conectar tres tablas distintas (actor, film_actor y film), ya que la relación entre actores y películas es de muchos a muchos. Este es mi primer uso de un JOIN múltiple para cruzar datos complejos.

---

###Consulta 18: Listado de títulos únicos
He obtenido la lista de todos los títulos de películas del catálogo. He utilizado la cláusula DISTINCT para garantizar que no aparezcan nombres duplicados en el resultado final, asegurando una lista limpia de títulos únicos.

---

###Consulta 19: Comedias de larga duración
He identificado las películas de género 'Comedy' que superan los 180 minutos. Tras realizar el cruce de tablas entre film, film_category y category, los resultados obtenidos son: CONTROL ANTHEM, SATURN NAME, SEARCHERS WAIT. Esto demuestra que el catálogo contiene producciones de comedia con una extensión poco habitual (más de 3 horas).

---

###Consulta 20: Categorías de larga duración
En este ejercicio, he combinado JOINs, GROUP BY y HAVING. El objetivo era identificar qué géneros de películas tienen, de media, una duración superior a los 110 minutos. 

---

###Consulta 21. Media de días de alquiler
He calculado el promedio de días que se prestan las películas. Sale exactamente 4.99 días.

Nota: En mi entorno de PostgreSQL me ha dado problemas al llamarla solo como film, así que he tenido que usar la ruta completa public.film para que conectara bien. Es un detalle de la configuración de mi base de datos, pero la lógica de la consulta es la misma.

---

###Consulta 22. Nombre completo de actores
He unido las columnas de nombre y apellido para crear un listado más legible de los actores. He usado la función CONCAT incluyendo un espacio entre ambos campos.

---

###Consulta 23. Alquileres por día
He analizado qué días hubo más movimiento en el videoclub. Para ello, he extraído la fecha de la columna rental_date de la tabla rental, agrupando los resultados y ordenándolos de mayor a menor actividad.

---

###Consulta 24. Películas con duración superior al promedio
He filtrado las películas que duran más que la media del catálogo. El promedio de duración es de 115.27 minutos.

Para resolverlo, he usado una subconsulta que calcula ese promedio global y lo compara con cada película. Así, el listado muestra solo los títulos que superan esa cifra (desde 116 minutos en adelante).

---

###Consulta 25. Número de alquileres por mes
He agrupado todos los registros de la tabla rental por meses para ver la evolución del negocio. El resultado muestra que el volumen de alquileres subió mucho en los meses de verano de 2005, llegando a superar los 6.700 alquileres en julio.

---

###Consulta 26. Estadísticas de los pagos 
He aplicado funciones estadísticas sobre la columna amount de la tabla de pagos para entender el comportamiento del gasto de los clientes:

Promedio: El pago medio por alquiler es de 4.20.

Desviación Estándar: Se sitúa en 2.36.

Varianza: 5.59.
Al ser la desviación estándar relativamente baja en comparación con el promedio, se deduce que los precios de los alquileres son bastante estables y no hay una dispersión extrema entre lo que pagan unos clientes y otros.

---

###Consulta 27. Películas con precio de alquiler superior a la media
He realizado un filtrado dinámico para localizar los títulos que tienen un coste de alquiler por encima del promedio general del catálogo. En lugar de usar un valor fijo, he empleado una subconsulta que calcula la media en tiempo real.

---

###Consulta 28. Actores con más de 40 películas
He filtrado a los actores con mayor trayectoria de la base de datos. Para ello, he agrupado los registros en la tabla film_actor por el ID del actor y he utilizado la cláusula HAVING para mostrar solo aquellos que cuentan con más de 40 participaciones. Esto permite identificar a los perfiles más rentables o populares dentro del catálogo.

---

###Consulta 29. Disponibilidad de películas en inventario
He cruzado las tablas de películas e inventario para saber cuántas copias tenemos de cada título. He optado por un LEFT JOIN para que el listado incluya absolutamente todas las películas de la base de datos; de esta forma, si alguna no tiene stock, aparecerá con valor 0 en lugar de quedar excluida de la lista.

---

###Consulta 30. Ranking de películas por actor
He generado un listado que muestra el volumen de trabajo de cada actor o actriz. Para conseguirlo, he unido las tablas de actor y film_actor, agrupando por sus nombres completos y contando cuántas películas tienen registradas en la base de datos. Esto nos da una visión clara de quiénes son los intérpretes con mayor presencia en nuestro catálogo.

---

###Consulta 31. Listado completo de películas y su reparto
He generado un informe que vincula cada película con sus actores. Lo más importante aquí ha sido el uso de LEFT JOIN partiendo de la tabla film. Esto garantiza que el listado muestre todas las películas del catálogo, permitiéndonos detectar fácilmente si algún título no tiene actores asociados en la base de datos, ya que en esos casos el campo del actor aparecerá vacío.

---

###Consulta 32. Actores y su filmografía (incluyendo registros sin películas)
He generado un listado completo de los actores de la base de datos vinculándolos con sus respectivos títulos. Al utilizar LEFT JOIN partiendo de la tabla actor, el informe garantiza la visibilidad de todos los intérpretes; si alguno de ellos no tiene películas asignadas actualmente, el campo "pelicula" aparecerá como valor nulo, facilitando la identificación de perfiles inactivos.

---

###Consulta 33. Relación completa de películas y sus históricos de alquiler
He generado un informe detallado que vincula cada título del catálogo con todos sus movimientos de alquiler. Al utilizar una cadena de LEFT JOIN desde film pasando por inventory hasta llegar a rental, el resultado permite visualizar el historial completo de salidas de cada cinta, incluyendo aquellas películas que, a pesar de estar en inventario, aún no han sido alquiladas nunca.

---

###Consulta 34. Top 5 clientes con mayor gasto acumulado
He identificado a nuestros clientes VIP sumando todos los pagos realizados por cada uno de ellos. Para esto, he conectado la tabla customer con payment a través de su ID común y he aplicado la función SUM sobre la columna amount. Finalmente, he ordenado los resultados de mayor a menor y limitado la salida a los 5 primeros registros.

---

###Consulta 35. Filtrado de actores por nombre específico
He realizado una consulta básica de filtrado utilizando la cláusula WHERE para localizar a todos los actores cuyo nombre de pila es 'JOHNNY'. 

---

###Consulta 36. Uso de alias para legibilidad de reportes
He aplicado alias a las columnas originales de la tabla actor. Al renombrar first_name como Nombre y last_name como Apellido, el resultado de la consulta es mucho más intuitivo para usuarios finales o para su integración en herramientas de visualización de datos, sin alterar la estructura real de la tabla en la base de datos.

---

### Consulta 37. Identificación de rangos en la tabla de actores
He utilizado las funciones de agregación MIN y MAX para determinar el rango de identificadores en la tabla actor. Esta consulta permite conocer de forma rapida el primer y el último ID registrados.

---

### Consulta 38. Conteo total de registros en la tabla actor
He utilizado la función de agregación COUNT para obtener la cantidad total de actores registrados en la base de datos. Esta operación es fundamental para validar la integridad de la carga de datos y proporcionar métricas rápidas sobre el tamaño del catálogo.

---

### Consulta 39. Clasificación alfabética de actores
He generado un listado de todos los actores del catálogo ordenados alfabéticamente por su apellido. Para ello, he utilizado la cláusula ORDER BY en modo ascendente (ASC). 

---

### Consulta 40. Selección limitada de registros (Top 5)
He recuperado los títulos de las primeras cinco películas de la tabla film utilizando la cláusula LIMIT. Esta técnica es fundamental para optimizar el rendimiento de las consultas en bases de datos extensas.

---
### Consulta 41. Análisis de popularidad de nombres entre actores
He utilizado la combinación de GROUP BY y COUNT para identificar patrones de repetición en los nombres de pila de los actores. Al ordenar los resultados según la frecuencia de aparición de forma descendente, he podido extraer de forma precisa cuál es el nombre más común en el catálogo.

---

### Consulta 42. Vinculación de transacciones y usuarios
He utilizado un INNER JOIN para cruzar las tablas customer y rental. Esta consulta es fundamental para el análisis operativo, ya que permite identificar qué usuario es responsable de cada registro de alquiler en el sistema. Al ordenar por rental_date, obtenemos una cronología clara de la actividad de los clientes.

---

### Consulta 43. Análisis de captación vs. actividad de clientes
He implementado un LEFT JOIN priorizando la tabla customer sobre rental. A diferencia del ejercicio anterior, esta consulta es inclusiva: muestra la totalidad de la base de datos de clientes, existan o no transacciones asociadas. Esto resulta crucial para identificar el segmento de clientes inactivos, detectables por la presencia de valores nulos en los campos de alquiler.

---

### Consulta 44. El Producto Cartesiano (CROSS JOIN)
He ejecutado un CROSS JOIN entre las tablas film y category para observar el comportamiento de una unión sin condiciones. Esta consulta genera todas las combinaciones posibles entre registros. Carece de valor analítico para este modelo de negocio, ya que crea relaciones artificiales que no reflejan la categorización real de los títulos.

---
###Consulta 45. Consulta Multi-Tabla: Actores por Género
He resuelto esta consulta utilizando un encadenamiento de cinco tablas para navegar desde la entidad actor hasta category. Tal como se observa en el diagrama de la base de datos, la tabla film actúa como el nodo central que conecta la participación de los actores (film_actor) con la clasificación por géneros (film_category). La cláusula DISTINCT ha sido aplicada para garantizar un listado único de nombres, eliminando duplicidades en casos donde un mismo actor ha participado en múltiples títulos de la misma categoría.

---
###Consulta 46. Identificación de actores sin películas (Subconsultas correlacionadas)
Para este ejercicio, el objetivo era encontrar actores que están dados de alta en la base de datos pero que no tienen ninguna película vinculada en la tabla asociativa film_actor.


---
###Consulta 47. Conteo de participaciones por actor
He utilizado una combinación de INNER JOIN y GROUP BY para calcular el volumen de películas por cada actor. Al agrupar por el ID único del actor y aplicar la función de agregado COUNT, se obtiene un desglose preciso de la actividad de cada intérprete en el catálogo. He añadido un ORDER BY descendente para visualizar rápidamente a los actores más que tienen mayor numero de peliculas.

---
###Consulta 48. Persistencia de datos mediante Vistas
He implementado la creación de una vista denominada actor_num_peliculas. Las vistas son herramientas fundamentales en SQL que permiten guardar una consulta compleja en el servidor como si fuera una tabla virtual. Esto facilita el acceso a reportes recurrentes (en este caso, la productividad de los actores) sin necesidad de reescribir todos los JOINs y las cláusulas GROUP BY en cada sesión.


---
#Consulta 49
49. Volumen de alquileres por cliente
He utilizado la función de agregado COUNT junto con un INNER JOIN para determinar la actividad de cada usuario en la plataforma. Al agrupar por el identificador único del cliente (customer_id), he podido contabilizar el número total de transacciones registradas en la tabla rental. Los resultados se han ordenado de mayor a menor para identificar fácilmente a los clientes más recurrentes.


---
#Consulta 50. Cálculo de métricas por categoría
He realizado una consulta agregada para obtener la duración total en minutos de todas las películas clasificadas bajo la categoría 'Action'. Para ello, ha sido necesario vincular las tablas film, film_category y category. Utilizando la función SUM sobre la columna length y filtrando por el nombre de la categoría, el sistema devuelve el tiempo total de duracion de las peliculas de accion.






