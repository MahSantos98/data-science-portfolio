-- 1. Quantidade de Filmes vs Séries
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- 2. Top 10 países com mais títulos
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- 3. Top 10 gêneros (listed_in)
SELECT genre, COUNT(*) AS total
FROM (
    SELECT unnest(string_to_array(listed_in, ', ')) AS genre
    FROM netflix_titles
) sub
GROUP BY genre
ORDER BY total DESC
LIMIT 10;

-- 4. Duração média de filmes
SELECT AVG(CAST(REPLACE(duration, ' min', '') AS INT)) AS media_duracao
FROM netflix_titles
WHERE type = 'Movie';

-- 5. Séries com mais temporadas
SELECT title, duration
FROM netflix_titles
WHERE type = 'TV Show'
ORDER BY CAST(REPLACE(REPLACE(duration, ' Season', ''), 's', '') AS INT) DESC
LIMIT 10; -- Altere para o que precisar.