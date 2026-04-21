## Proyecto_Sakila

### Descripción del Proyecto
Este proyecto consiste en resolver un caso práctico de negocio utilizando consultas SQL en DBeaver.

### Herramientas Utilizadas
* **Base de Datos:** PostgreSQL
* **Gestor de BBDD:** DBeaver.
* **Control de versiones:** GitHub.

### Informe de Análisis

### Consulta 2: Clasificación 'R'
Tras analizar la base de datos, se identificaron todas las películas con clasificación 'R' (Restringida). Esto permite segmentar el catálogo para audiencias adultas.

---

### Consulta 3: Actores por ID
Se extrajo un listado de actores específicos mediante su identificador único (rango de ID 30 al 40) para tareas de auditoría de registros.

---

### Consulta 4: Comparación de Idiomas
Se intentó comparar el idioma actual con el original. Se detectó que la columna `original_language_id` contiene valores nulos en su totalidad, lo que impide una comparación efectiva en este momento.

---

### Consulta 5: Duración de Películas
Se realizó un análisis de los tiempos de metraje, identificando que las películas más cortas duran 46 minutos, mientras que las más largas alcanzan los 185 minutos.

---

### Consulta 6: Búsqueda por Apellido
Se identificaron 3 actores registrados con el apellido **Allen**: Cuba Allen, Kim Allen y Meryl Allen. Se aplicaron filtros para asegurar la precisión frente a mayúsculas.

---

### Consulta 7: Conteo por Clasificación
El catálogo cuenta con 1000 títulos distribuidos de forma variada:
* **Mayor volumen:** PG-13 (223 títulos).
* **Menor volumen:** G (178 títulos).

---

### Consulta 8: Filtro PG-13 y Larga Duración
Se identificaron los títulos que pertenecen a la clasificación PG-13 o que tienen una duración extensa (superior a los 180 minutos).

---
