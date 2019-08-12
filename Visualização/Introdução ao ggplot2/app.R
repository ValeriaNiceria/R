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


df_continente <- countrycode::codelist %>% 
  # selecionar colunas importantes
  select(country = cow.name, continent) %>% 
  # filtrar fora os países sem continentes 
  filter(!is.na(continent))

df_pais$country <- as.character(df_pais$country)

# criar dataframe com junção dos dois
df <- left_join(df_pais,
                df_continente,
                by = "country")


# consertar manualmente os continentes de certos países
df$continent[df$country == "Congo (Brazzaville)"] <- "Africa"
df$continent[df$country == "Congo (Kinshasa)"] <- "Africa"
df$continent[df$country == "Hong Kong S.A.R of China"] <- "Asia"
df$continent[df$country == "Kosovo"] <- "Europe"
df$continent[df$country == "North Cyprus"] <- "Asia"
df$continent[df$country == "Palestinian Territories"] <- "Asia"
df$continent[df$country == "Serbia"] <- "Europe"
df$continent[df$country == "Somaliland region"] <- "Africa"
df$continent[df$country == "Taiwan Province of China"] <- "Asia"
df$continent[df$country == "United States"] <- "Americas"

# transformar coluna de ano para inteiro
df$year <- as.integer(df$year)

df$year %>% unique()

# criar dataset apenas para o ano mais recente
df_2017 <- df %>% 
  filter(year == max(year))
