# 📊 Análise de Dados da Netflix com Python  

Este projeto realiza uma **análise exploratória de dados (EDA)** no dataset público **Netflix Movies and TV Shows** (Kaggle).  
O objetivo é entender melhor o catálogo da Netflix ao longo dos anos, explorando **gêneros, países, filmes vs. séries, duração, dados faltantes** e outros padrões.  

---

## 📂 Estrutura do Projeto  

- `Netflix_project.py` → Script principal da análise  
- `netflix_titles.csv` → Dataset original (Kaggle)  
- Gráficos gerados com **Matplotlib** e **Seaborn**  

---

## 📌 Objetivos da Análise  

- **Quantidade de Filmes vs Séries** → comparar a proporção de títulos disponíveis.  
- **Top 10 países com mais títulos** → identificar os países que mais produzem conteúdo.  
- **Top 10 gêneros (listed_in)** → descobrir quais gêneros dominam o catálogo.  
- **Duração média**  
  - Filmes → duração em minutos.  
  - Séries → quantidade de temporadas.  
- **Dados faltantes** → visualizar a proporção de valores nulos em cada coluna.  

---

## 📈 Exemplos de Resultados  

- Filmes vs Séries  
- Top 10 países  
- Top gêneros  
- Duração média  
- Dados faltantes  

---

## 🛠️ Tecnologias Utilizadas  

- **Python 3.13**  
- **Pandas** (manipulação de dados)  
- **Matplotlib / Seaborn** (visualizações)  
- **Prophet (opcional)** → para previsões de séries temporais  

---

## 🚀 Como Executar  

Clone este repositório:  
```bash
git clone https://github.com/MahSantos98/data-science-portfolio.git
cd data-science-portfolio/python-projects/netflix-analysis
pip install -r requirements.txt
python Netflix_project.py

