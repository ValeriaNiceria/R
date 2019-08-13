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


# geom_bar() e geom_col()
# Tarefa: Criando um gráfico mostrando a média do score de felidade por continente
df_2017 %>% 
  group_by(continent) %>% 
  summarise(life_ladder = mean(life_ladder)) %>% 
  ggplot(aes(x = continent, y = life_ladder)) +
  geom_col()



# geom_point()
df_2017 %>% 
  filter(!is.na(log_gdp_per_capita), !is.na(healthy_life_expectancy_at_birth)) %>% 
  ggplot(aes(x = log_gdp_per_capita, y = healthy_life_expectancy_at_birth)) +
  geom_point()



# geom_line()
df %>% 
  filter(country == 'Brazil') %>% 
  ggplot(aes(x = year, y = life_ladder)) +
  geom_line()



# geom_histogram()
df_2017 %>% 
  ggplot(aes(x = life_ladder)) +
  geom_histogram()



# geom_text()
df_2017 %>%
  ggplot(aes(x = log_gdp_per_capita, y = healthy_life_expectancy_at_birth)) +
  geom_point() +
  geom_text(aes(label = country))



# geom_hline() e geom_vline()
df_2017 %>% 
  ggplot(aes(x = log_gdp_per_capita, y = healthy_life_expectancy_at_birth)) +
  geom_point() +
  geom_vline(aes(xintercept = mean(df_2017$log_gdp_per_capita, na.rm = TRUE))) +
  geom_hline(aes(yintercept = mean(df_2017$healthy_life_expectancy_at_birth, na.rm = TRUE)))
