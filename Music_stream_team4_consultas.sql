USE music_stream2;


						-- CONSULTAS DE TODOS LOS GENEROS --
                        
-- 1. CARECTERÍSTICAS BBDD: ¿Cuántas canciones y artistas tenemos en nuestra BBDD? 

	SELECT s.genero,COUNT(s.nombre_cancion) AS canciones_totales
	FROM spotify s
	GROUP BY  s.genero
	ORDER BY  s.genero;
    
    SELECT COUNT(l.nombre_artista)
	FROM lastfm l;

-- 2. Ranking géneros con más oyentes y reproducciones de mayor a menor  (ultimos 6 años)

SELECT 
    s.genero,
    SUM(l.oyentes) AS oyentes_totales,
    SUM(l.reproducciones) AS reproducciones_totales
FROM 
    lastfm l
JOIN 
    spotify s ON s.nombre_artista = l.nombre_artista
GROUP BY 
    s.genero
ORDER BY 
    oyentes_totales DESC;

-- 3. Top 10 artistas más y menos oyentes

SELECT s.nombre_artista, SUM(l.oyentes) AS oyentes_totales
FROM lastfm l
JOIN spotify s ON s.nombre_artista = l.nombre_artista
GROUP BY s.nombre_artista
ORDER BY oyentes_totales DESC
LIMIT 10;

SELECT s.nombre_artista, SUM(l.oyentes) AS oyentes_totales
FROM lastfm l
JOIN spotify s ON s.nombre_artista = l.nombre_artista
GROUP BY s.nombre_artista
ORDER BY oyentes_totales ASC
LIMIT 10;

-- 4.Evolución de oyentes por género en los últimos 6 años
-- sub calcula cuántas canciones tiene cada artista.
-- Luego dividimos l.oyentes / cantidad_canciones para estimar oyentes por canción.
-- Agrupamos por genero y anio para obtener la evolución estimada.

SELECT 
    S.Anio,
    S.Genero,
    ROUND(AVG(L.Oyentes)) AS Oyentes_promedio
FROM 
    Spotify S
JOIN 
    LastFM L ON S.Nombre_artista = L.Nombre_artista
WHERE 
    s.anio BETWEEN 2019 AND 2024     
GROUP BY 
    S.Anio, S.Genero
ORDER BY 
    S.Anio, Oyentes_promedio DESC;


							-- CONSULTAS POR GENERO --
                            
-- 1. Evolución de oyentes del genero en los últimos 6 años

SELECT 
    s.genero,
    s.anio,
    ROUND(SUM(l.oyentes / sub.cantidad_canciones)) AS oyentes_estimados
FROM 
    spotify s
JOIN 
    lastfm l ON s.nombre_artista = l.nombre_artista
JOIN (
    SELECT nombre_artista, COUNT(*) AS cantidad_canciones
    FROM spotify
    GROUP BY nombre_artista
) AS sub ON s.nombre_artista = sub.nombre_artista
WHERE 
    s.anio BETWEEN 2019 AND 2024
    AND s.genero = 'Indie'
GROUP BY 
    s.genero, s.anio
ORDER BY 
    s.anio;


-- 2. Top 10 artistas con mas oyentes por año

SELECT 
    s.nombre_artista,  
    s.genero, 
    MAX(l.biografia) AS biografia, 
    MAX(l.artistas_similares) AS artistas_similares,
    SUM(l.oyentes) AS oyentes_totales
FROM 
    lastfm l
JOIN 
    spotify s ON s.nombre_artista = l.nombre_artista
WHERE 
    s.genero = 'indie'
GROUP BY 
    s.nombre_artista, s.genero
ORDER BY 
    oyentes_totales DESC
LIMIT 10;

-- 3. Top 5 de artistas más escuchados de cada genero y su biografía y artistas similares

SELECT 
    s.nombre_artista,  
    s.genero, 
    MAX(l.biografia) AS biografia, 
    MAX(l.artistas_similares) AS artistas_similares,
    SUM(l.reproducciones) AS reproducciones_totales
FROM 
    lastfm l
JOIN 
    spotify s ON s.nombre_artista = l.nombre_artista
WHERE 
    s.genero = 'indie'
GROUP BY 
    s.nombre_artista, s.genero
ORDER BY 
    reproducciones_totales DESC
LIMIT 5;


-- 4. Top 5 de artistas menos escuchados de cada genero y su biografía y artistas similares

SELECT 
    s.nombre_artista,  
    s.genero, 
    MAX(l.biografia) AS biografia, 
    MAX(l.artistas_similares) AS artistas_similares,
    SUM(l.reproducciones) AS reproducciones_totales
FROM 
    lastfm l
JOIN 
    spotify s ON s.nombre_artista = l.nombre_artista
WHERE 
    s.genero = 'indie'
GROUP BY 
    s.nombre_artista, s.genero
ORDER BY 
    reproducciones_totales ASC
LIMIT 5;

-- 5. Top 20 canciones canciones mas escuchadas 

SELECT 
    s.nombre_cancion,
    s.nombre_artista,
    s.genero,
    s.anio,
    ROUND(l.reproducciones / sub.cantidad_canciones) AS reproducciones_estimadas
FROM 
    spotify s
JOIN 
    lastfm l ON s.nombre_artista = l.nombre_artista
JOIN (
    SELECT nombre_artista, COUNT(*) AS cantidad_canciones
    FROM spotify
    GROUP BY nombre_artista
) AS sub ON s.nombre_artista = sub.nombre_artista
WHERE 
    s.genero = 'Indie'
ORDER BY 
    reproducciones_estimadas DESC
LIMIT 20;





                            