-- 1. Países com maior diversidade de gêneros
SELECT country, COUNT(DISTINCT genre) AS generos_unicos
FROM (
    SELECT country, unnest(string_to_array(listed_in, ', ')) AS genre
    FROM netflix_titles
    WHERE country IS NOT NULL
) sub
GROUP BY country
ORDER BY generos_unicos DESC
LIMIT 10;

-- 2. Palavras mais comuns nas descrições
WITH palavras AS (
    SELECT unnest(string_to_array(lower(regexp_replace(description, '[^\w\s]', '', 'g')), ' ')) AS palavra
    FROM netflix_titles
    WHERE description IS NOT NULL
)
SELECT palavra, COUNT(*) AS total
FROM palavras
WHERE palavra NOT IN ('the','a','an','and','of','to','in','on','for','with','is','it') -- stopwords simples
GROUP BY palavra
ORDER BY total DESC
LIMIT 20;

-- 3. Média de duração de filmes por década
SELECT (release_year/10)*10 AS decada,
       ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS INT)), 2) AS media_duracao
FROM netflix_titles
WHERE type = 'Movie' AND duration LIKE '%min%'
GROUP BY decada
ORDER BY decada;

-- 4. Países que mais colaboram em co-produções
SELECT country, COUNT(*) AS total_coproducoes
FROM (
    SELECT unnest(string_to_array(country, ', ')) AS country
    FROM netflix_titles
    WHERE country LIKE '%,%' -- pega apenas os que têm mais de um país
) sub
GROUP BY country
ORDER BY total_coproducoes DESC
LIMIT 10;

-- 5. Séries com mais atores no elenco
SELECT title, array_length(string_to_array(cast_name, ', '), 1) AS qtd_atores
FROM netflix_titles
WHERE type = 'TV Show' AND cast_name IS NOT NULL
ORDER BY qtd_atores DESC
LIMIT 10;