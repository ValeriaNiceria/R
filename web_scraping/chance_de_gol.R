# install.packages(c("tibble", "httr", "rvest", "dplyr", "ggplot2", "purrr"))

library(tibble)
library(httr)
library(rvest)
library(dplyr)
library(ggplot2)
library(purrr)


# Acessando a página de um ano
ano <- 2018
cdg_url <- sprintf('http://www.chancedegol.com.br/br%02d.htm', ano - 2000)

cdg_html <- cdg_url %>% 
  httr::GET() %>% 
  httr::content('text', encoding = 'latin1') %>% 
  xml2::read_html() %>% 
  rvest::html_node('table')


# Cores da tabela
cores <- cdg_html %>%
  html_nodes(xpath = '//font[@color="#FF0000"]') %>%
  html_text()


# Nomes e estruturas da tabela
cdg_data <- cdg_html %>% 
  html_table(header = TRUE) %>% 
  setNames(c('dt_jogo', 'mandante', 'placar', 'visitante', 'p_mandante', 'p_empate', 'p_visitante')) %>% 
  mutate(p_vitorioso = cores) %>% 
  as_tibble() %>% 
  mutate(result = 'OK')


# Colocando dentro de uma função
cdg_ano <- function(ano) {
  cdg_url <- sprintf('http://www.chancedegol.com.br/br%02d.htm', ano - 2000)
  
  cdg_html <- cdg_url %>%
    GET() %>%
    content('text', encoding = 'latin1') %>%
    read_html() %>%
    html_node('table')
  
  cores <- cdg_html %>%
    html_nodes(xpath = '//font[@color="#FF0000"]') %>%
    html_text()
  
  cdg_data <- cdg_html %>%
    html_table(header = TRUE) %>%
    setNames(c('dt_jogo', 'mandante', 'placar', 'visitante',
               'p_mandante', 'p_empate', 'p_visitante')) %>% 
    mutate(p_vitorioso = cores) %>% 
    as_tibble() %>% 
    mutate(result = 'OK')
  
  cdg_data
}



# Vetorizando anos
cdg_anos <- function(anos) {
  cdg_ano_safe <- failwith(tibble(result = 'erro'), cdg_ano)
  anos %>% 
    setNames(anos) %>% 
    map_df(cdg_ano_safe, .id = 'ano')
}

d_cdg <- cdg_anos(c(2017, 2018))
