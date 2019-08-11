library(tidyverse)
# Pacote janitor para limpar os nomes das colunas
library(janitor)
# Metadados gerais de países
library(countrycode)
# Combinar vários gráficos do ggplot2 em um só
library(patchwork) # devtools::install_github("thomasp85/patchwork")
# Checando a versão dos pacotes
sessionInfo()


# importar a planilha
df_pais <-  read.csv("felicidade.csv")
# limpar o nome das colunas
df_pais <- janitor::clean_names(df_pais)
# olhar dados 
glimpse(df_pais)
