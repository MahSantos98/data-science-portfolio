-- 1. Evolução de lançamentos por ano
SELECT release_year, COUNT(*) AS total
FROM netflix_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- 2. Ranking de diretores mais produtivos
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total DESC
LIMIT 10;

-- 3. Quantidade média de gêneros por título
SELECT ROUND(AVG(genres_count), 2) AS media_generos
FROM (
    SELECT show_id, array_length(string_to_array(listed_in, ', '), 1) AS genres_count
    FROM netflix_titles
) sub;

-- 4. Distribuição de classificações etárias (rating)
SELECT rating, COUNT(*) AS total
FROM netflix_titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total DESC;

-- 5. Títulos adicionados por ano no catálogo (date_added)

SELECT EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS ano_adicionado,
       COUNT(*) AS total
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY ano_adicionado
ORDER BY ano_adicionado;