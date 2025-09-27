# 🗄️ Análise de Dados da Netflix com SQL  

Este projeto realiza consultas SQL no dataset público **Netflix Movies and TV Shows** (Kaggle) utilizando **PostgreSQL**.  
O objetivo é explorar o catálogo da Netflix ao longo dos anos, extraindo insights a partir de consultas em diferentes níveis: **básico, intermediário e avançado**.  

---

## 📂 Estrutura do Projeto  

- `create_table.sql` → Script de criação da tabela  
- `netflix_analysis_basic.sql` → Consultas básicas e intermediárias  
- `netflix_analysis_advanced.sql` → Consultas avançadas  

---

## 📌 Objetivos da Análise  

- **Quantidade de Filmes vs Séries** → comparar a proporção de títulos disponíveis.  
- **Top 10 países com mais títulos** → identificar os países que mais produzem conteúdo.  
- **Top 10 gêneros (listed_in)** → descobrir quais gêneros dominam o catálogo.  
- **Duração média** → analisar tempo médio de filmes e temporadas de séries.  
- **Séries com mais temporadas** → identificar títulos de maior longevidade.  
- **Evolução de lançamentos por ano** → acompanhar o crescimento do catálogo.  
- **Diretores e países mais diversos em gêneros** → medir variedade de produções.  
- **Palavras mais comuns em descrições e títulos** → analisar padrões de conteúdo.  

---

## 📈 Exemplos de Resultados  

- 🎬 Filmes vs Séries  
- 🌍 Top 10 países  
- 🎭 Top gêneros  
- ⏱️ Duração média de filmes e séries  
- 📝 Palavras mais comuns em descrições  
- 🤝 Co-produções entre países  

---

## 🛠️ Tecnologias Utilizadas  

- **PostgreSQL 13+**  
- Funções SQL: `GROUP BY`, `STRING_TO_ARRAY`, `UNNEST`, `REGEXP_REPLACE`, `CTEs`  
- Dataset: [Netflix Movies and TV Shows (Kaggle)](https://www.kaggle.com/shivamb/netflix-shows)  

---

## 🚀 Como Executar  

Clone este repositório:  
```bash
git clone https://github.com/MahSantos98/data-science-portfolio.git
cd netflix-analysis/sql-project
