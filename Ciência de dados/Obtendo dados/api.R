# API
library(jsonlite)
library(dplyr)

# GitHub
valeria.rep <- jsonlite::fromJSON("https://api.github.com/users/ValeriaNiceria/repos")
dim(valeria.rep)
head(valeria.rep[,c('name', 'description')], 15)


# Dados abertos
proposicoes <- jsonlite::fromJSON("https://dadosabertos.camara.leg.br/api/v2/proposicoes")
head(proposicoes$dados %>% select(siglaTipo, numero, ano, ementa))


# Quandl
# Rfacebook
# twitterR
# ggmap
