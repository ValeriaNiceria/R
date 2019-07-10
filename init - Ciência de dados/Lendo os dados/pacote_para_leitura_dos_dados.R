library(tidyverse)

getwd()

# lendo o arquivo
senado <- read.csv("Ciência de dados/Lendo os dados/dados/aposentados.csv")

# Inicio 
senado %>% head()

# Final
senado %>% tail()

# Estrutura do objeto
senado %>% str()

# Tipo do objeto
senado %>% class()

# Estatística básica do objeto
senado %>% summary()
