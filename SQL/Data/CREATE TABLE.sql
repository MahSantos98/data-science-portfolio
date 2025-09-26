-- 1. Criar a tabela
CREATE TABLE netflix_titles (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast_name TEXT,
    country TEXT,
    date_added TEXT,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(50),
    listed_in TEXT,
    description TEXT
);


-- 2. Importar os dados do CSV
-- Ajuste o caminho conforme a localização do arquivo na sua máquina/servidor

COPY netflix_titles (
    show_id, type, title, director, cast_name, country, date_added,
    release_year, rating, duration, listed_in, description
)
FROM 'D:/Estudos/ProjetoGitHub/data/netflix_titles.csv'
DELIMITER ','
CSV HEADER
ENCODING 'UTF8'
QUOTE '"';

select * from netflix_titles
