# Select
library(dplyr)
senadores <- read.csv("dados/aposentados.csv")

# Selecionado as colunas de um data.frame
senadores_ano_sexo <- senadores %>% 
  select(Anos.de.Serviço.do.Segurado, Sexo)

head(senadores_ano_sexo)

# Escolhendo as colunas que não quer do data.frame
senadores_ano_sexo <- senadores %>% 
  select(-Anos.de.Serviço.do.Segurado, -Sexo)

head(senadores_ano_sexo)
