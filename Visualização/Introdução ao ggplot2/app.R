library(tidyverse)
# Pacote janitor para limpar os nomes das colunas
library(janitor)
library(readxl)
# Metadados gerais de países
library(countrycode)
# Combinar vários gráficos do ggplot2 em um só
library(patchwork) # devtools::install_github("thomasp85/patchwork")
# Checando a versão dos pacotes
sessionInfo()


# baixe o arquivo do endereco:
# download.file("https://s3.amazonaws.com/happiness-report/2018/WHR2018Chapter2OnlineData.xls", destfile = "felicidade.xls")


# importar a planilha
df_pais <-  read.xlsx("felicidade.xls")
# limpar o nome das colunas
df_pais <- janitor::clean_names(df_pais)
# olhar dados 
glimpse(df_pais)