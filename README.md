
🎧 Proyecto Stream Music 
Descripción General
Stream Music es un proyecto de análisis de datos musicales cuyo objetivo es integrar información proveniente de múltiples APIs para explorar el comportamiento de los oyentes, tendencias de géneros musicales, y rendimiento de artistas y canciones a lo largo del tiempo. 
Este proyecto se divide en cuatro fases principales: extracción de datos, modelado de base de datos, análisis mediante SQL y visualización de resultados.
________________________________________
🧩 Fase 1: Extracción de Datos
En esta fase se lleva a cabo la recopilación de información desde fuentes externas:
•	🔗 API de Spotify: Se extrae información relevante sobre artistas, canciones, géneros, oyentes mensuales, popularidad, etc.
•	🔗 API de Last FM: Se obtiene información complementaria como biografías de artistas, oyentes por país, artistas similares, y datos históricos.
•	🗂️ Almacenamiento: Los datos recopilados son procesados y almacenados en archivos .csv estructurados, que servirán como fuente para la posterior carga en base de datos.
________________________________________
🏗️ Fase 2: Diseño y Creación de la Base de Datos
Esta fase comprende la modelización y carga de los datos:
•	📐 Diseño del modelo relacional: Se definen las entidades principales (artistas, canciones, géneros, años, estadísticas de escucha, etc.) y sus relaciones.
•	🛠️ Creación de la base de datos: Implementación del modelo en un motor de bases de datos .
•	📥 Carga de datos: Inserción de los datos provenientes de los archivos .csv en las tablas correspondientes.
________________________________________

📊 Fase 3: Análisis de Datos (Consultas SQL)
El objetivo de esta fase es extraer conocimiento útil a partir de los datos almacenados. Se desarrollaron diversas consultas para responder preguntas generales y específicas del comportamiento musical:
🎼 Consultas Generales
1.	Resumen general: ¿Cuántas canciones y artistas contiene la base de datos?
2.	Ranking de géneros: Ordenar los géneros musicales con mayor cantidad de oyentes y reproducciones en los últimos 6 años.
3.	Top artistas:
o	Top 10 artistas con más oyentes.
o	Top 10 artistas con menos oyentes.
4.	Evolución temporal por género:
o	Estimación de oyentes por canción (oyentes / cantidad de canciones).
o	Agrupación por género y año para visualizar la evolución de popularidad.
🎧 Consultas por Género
1.	Evolución de oyentes por género en rango años seleccionado.
2.	Top 10 artistas más escuchados por año, segmentado por género.
3.	Top 5 artistas más escuchados de cada género, junto con su biografía y artistas similares.
4.	Top 5 artistas menos escuchados de cada género, junto con su biografía y artistas similares.
5.	Top 20 canciones más reproducidas globalmente.
Estas consultas permiten construir una visión analítica detallada y dinámica sobre el ecosistema musical representado en la base de datos.
________________________________________
🖥️ Fase 4: Presentación Visual (Demo Canva)
La última fase consiste en una presentación visual de los resultados obtenidos, creada en Canva, donde se resumen los hallazgos más relevantes mediante gráficos, tablas y visualizaciones interactivas que facilitan la comprensión del análisis realizado.
________________________________________
🚀 Tecnologías Utilizadas
•	Python para la conexión y consumo de APIs (Spotify, Last FM).
•	Pandas y CSV para procesamiento y almacenamiento temporal.
•	MySQL paramodelado relacional y consultas.
•	SQL para extracción de información.
•	Canva para la presentación visual.

