# Filmes IMDB ------------------
if (!require(ggplot2movies)) install.packages("ggplot2movies")

library(ggplot2movies)
library(tidyverse)

dados <- ggplot2movies::movies 
dados <- dados %>%
  filter(!is.na(budget), budget > 0) %>% 
  dplyr::select(title, year, budget, rating) %>% 
  arrange(desc(year))

# Tentando prever a nota utilizando as variáveis 'budget' e 'year'
modelo <- lm(rating ~ budget + year, data = dados)
# summary(modelo)

# -----------------------------------------------------

#* @get /amostrar_filmes
amostrar_filmes <- function() {
  dados %>% 
    sample_n(10)
}


#* @post /prever_nota_filme
prever_nota_filme <- function(orcamento, ano) {
  d <- data.frame(
    budget = as.numeric(orcamento),
    year = as.numeric(ano)
  ) 
  
  predict(modelo, newdata = d)
}
