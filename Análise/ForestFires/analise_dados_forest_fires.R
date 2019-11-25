# Lendo os dados
dados <- read.csv("amazon.csv", encoding = "latin1")

# Primeiras linhas dos dados
View(head(dados))

# instalando o pacote 'dplyr' que irá ajudar na manipulação dos dados
install.packages("dplyr")

# Carregando o pacote que foi instalado
library(dplyr)

# Começando a manipulação dos dados.
# Calculando o total de queimadas por ano.
queimadas_ano <- 
dados %>% 
  group_by(year) %>% 
  summarise(total_queimadas = sum(number))

# Carregando o pacote 'tidyr'
library(tidyr)

# Transformando cada ano em uma coluna e visualizando o resultado em uma tabela.
queimadas_ano %>% 
  spread(year, total_queimadas) %>% 
  View()


# Carregando o pacote 'ggplot2' - para geração de gráficos
library(ggplot2)

# Visualizando o total de queimadas por ano em um gráfico.
ggplot(queimadas_ano, aes(year, total_queimadas)) +
  geom_col(aes(fill=total_queimadas)) +
  scale_x_continuous(breaks = seq(from = 1998, to = 2017, by = 1)) +
  scale_y_continuous(breaks = seq(from = 0, to = 50000, by = 5000)) +
  labs(x = "Ano", y = "Número de queimadas", title = "Número total de queimadas por ano") +
  scale_fill_gradientn(colors = c("#f9020e", "#9b0000"))


# Verificando a evolução das queimadas no ano de '2003'
queimadas_2003 <-
  dados %>% 
  filter(year == 2003) %>% 
  group_by(month) %>% 
  summarise(total = sum(number))

# Construindo um dataframe com os meses e um número que representa esse mês
meses <- data.frame(
  month = c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"),
  num_month = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
)

# Juntando os dataframes pelo mês e tranformando a coluna mês no tipo caracter
df_queimadas_2003 <- left_join(queimadas_2003, meses, by = "month") %>% 
  mutate(month = as.character(month)) 

# Ordenando os dados pelos números que representam os meses
df_queimadas_2003 <- df_queimadas_2003 %>% arrange(num_month)

# Visualizando os dados em uma tabela
View(df_queimadas_2003)


# Visualizando os dados em um gráfico
ggplot(df_queimadas_2003, aes(x = factor(month, levels = month), total)) +
  geom_col(color = "#9e0007", fill = "#c4000d") +
  scale_y_continuous(breaks = seq(from = 0, to = 6000, by = 500))  +
  labs(x = "Mês", y = "Número de queimadas", title = "Número de queimadas durante o ano de 2003") +
  theme(legend.position = "none")
  


# Número de queimadas em média durante os meses, nos anos disponíveis
queimadas_media_mes <-
  dados %>% 
  group_by(year, month) %>% 
  summarise(total = sum(number)) %>% 
  group_by(month) %>% 
  summarise(media = mean(total))

teste <-
dados %>% 
  left_join(uf_state) %>% 
  group_by(UF) %>% 
  summarise(total = sum(number)) %>% 
  mutate(UF = as.character(UF))


hcmap("countries/br/br-all", data = teste, value = "total",
      joinBy =  c("hc-a2", "UF"), name= "Total de queimadas",
      dataLabels = list(enabled = TRUE, format = '{point.code}'),
      tooltip = list(valueDecimals = 2, valuePrefix = "")) %>%
  hc_colorAxis(minColor = "#FEE4D7", maxColor = "#9b0000") %>% 
  hc_credits(enabled = FALSE)


graf_map_queimadas_totais
ui_graf_queimadas_estados_totais

# Juntando os dataframes pelo mês e tranformando a coluna mês no tipo caracter
df_queimadas_media_mes <- left_join(queimadas_media_mes, meses, by = "month") %>% 
  mutate(month = as.character(month)) 

# Ordenando os dados pelos números que representam os meses
df_queimadas_media_mes <- df_queimadas_media_mes %>% arrange(num_month)

# Visualizando os dados em uma tabela
View(df_queimadas_media_mes)


# Visualizando os dados em um gráfico
ggplot(df_queimadas_media_mes, aes(x = factor(month, levels = month), media)) +
  geom_col(color = "#9e0007", fill = "#c4000d") +
  scale_y_continuous(breaks = seq(from = 0, to = 6000, by = 500))  +
  labs(x = "Mês", y = "Número de queimadas", title = "Número médio de queimadas por mês durante os anos") +
  theme(legend.position = "none")
