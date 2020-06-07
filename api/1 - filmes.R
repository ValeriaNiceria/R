# opencpu
# plumber

# Filmes IMDB ------------------
if (!require(ggplot2movies)) install.packages("ggplot2movies")

library(ggplot2movies)
library(tidyverse)

dados <- ggplot2movies::movies 
View(dados)

dados <- dados %>%
  filter(!is.na(budget), budget > 0) %>% 
  dplyr::select(title, year, budget, rating) %>% 
  arrange(desc(year))


# Tentando prever a nota utilizando as variáveis 'budget' e 'year'
modelo <- lm(rating ~ budget + year, data = dados)
summary(modelo)

prever_nota_filme <- function(orcamento, ano) {
  predict(
    modelo, 
    newdata = data.frame(
      budget = orcamento, 
      year = ano
    )
  )
}

amostrar_dez_filmes <- function(dados) {
  dados %>%
    sample_n(10)
}


# Criar API plumber, necessário:
# - Uma função que executa uma ação
# - Uma documentação da função
# - Selecionar uma porta para disponibilizar a api
if (!require(plumber)) install.packages("plumber", dependencies = T)
library(plumber)

# Rodar exemplo api usando plumber
p <- plumber::plumb("R/funcoes_api.R")
p$run(port = 3333)

