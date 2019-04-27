# Mutate - para criar novos campos
library(dplyr)

getwd()
setwd("C:/Users/valeria/Documents/EstudoR/Ciência de dados/Manipulando os dados/dplyr")
senadores <- read.csv("dados/aposentados.csv")

senadores %>% names()

senadores_ano_sexo <- senadores %>%
  select(Anos.de.Serviço.do.Segurado, Sexo, Vlr.Benefícios.Concedidos..R..) %>% 
  filter(Sexo == "Masculino") %>% 
  distinct() %>% 
  mutate(
    'Valor.K' = as.numeric(Vlr.Benefícios.Concedidos..R..) / 1000
  )


