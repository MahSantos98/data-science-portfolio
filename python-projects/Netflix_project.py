# =========================================================
# 0. Setup inicial
# =========================================================
import os
os.environ["MPLCONFIGDIR"] = r"D:/Estudos/.matplotlib"

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Se quiser usar previsão, instale: pip install prophet
from prophet import Prophet  

# Configuração visual
sns.set(style="whitegrid", palette="pastel")
plt.rcParams["figure.figsize"] = (10, 6)

# 1. Carregar dataset
df = pd.read_csv(r"D:/Estudos/ProjetoGitHub/data/netflix_titles.csv")

print("Formato do dataset:", df.shape)
print("\nInformações do dataset:")
print(df.info())
print("\nPrimeiras linhas:")
print(df.head())

# =========================================================
# 2. Quantidade de filmes x séries
# =========================================================
conteudo_tipo = df['type'].value_counts()

plt.figure()
sns.barplot(x=conteudo_tipo.index, y=conteudo_tipo.values)
plt.title("Quantidade de Filmes vs Séries na Netflix")
plt.xlabel("Tipo")
plt.ylabel("Quantidade")
plt.grid(True, linestyle="--", alpha=0.5)
plt.show()

# =========================================================
# 3. Top 10 países com mais títulos
# =========================================================
top_paises = df['country'].value_counts().head(10)

plt.figure()
sns.barplot(y=top_paises.index, x=top_paises.values)
plt.title("Top 10 Países com mais títulos")
plt.xlabel("Quantidade de títulos")
plt.ylabel("País")
plt.grid(True, linestyle="--", alpha=0.5)
plt.show()

# =========================================================
# 4. Top gêneros (coluna 'listed_in')
# =========================================================
generos = df['listed_in'].dropna().str.split(', ')
generos_exploded = generos.explode()
top_generos = generos_exploded.value_counts().head(10)

plt.figure()
sns.barplot(y=top_generos.index, x=top_generos.values)
plt.title("Top 10 gêneros na Netflix")
plt.xlabel("Quantidade de títulos")
plt.ylabel("Gênero")
plt.show()

# =========================================================
# 5. Duração média (filmes e séries)
# =========================================================
# Filmes
filmes = df[df['type'] == "Movie"].copy()
filmes['duration_num'] = filmes['duration'].str.replace(" min", "", regex=True).astype(float)

# Séries
series = df[df['type'] == "TV Show"].copy()
series['duration_num'] = series['duration'].str.replace(" Season", "", regex=True).str.replace("s","").astype(float)

plt.figure()
sns.histplot(filmes['duration_num'].dropna(), bins=30, kde=True, color="blue", label="Filmes")
plt.title("Distribuição da duração de filmes (minutos)")
plt.xlabel("Minutos")
plt.legend()
plt.show()

plt.figure()
sns.histplot(series['duration_num'].dropna(), bins=10, kde=False, color="orange", label="Séries")
plt.title("Distribuição da duração de séries (temporadas)")
plt.xlabel("Temporadas")
plt.legend()
plt.show()

# =========================================================
# 6. Dados faltantes
# =========================================================
plt.figure(figsize=(10,5))
df.isna().mean().sort_values(ascending=False).plot(kind="bar", color="red")
plt.title("Proporção de valores faltantes por coluna")
plt.ylabel("Proporção (%)")
plt.show()
