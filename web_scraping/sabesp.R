install.packages(c("lubridate"))

## pacotes
library(tibble)
library(httr)
library(rvest)
library(lubridate)
library(stringr)
library(purrr)
library(dplyr)

## acessa p??gina principal
link <- 'http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx'
txt <- GET(link)

## fun????o que pega viewstate ou eventvalidation da p??gina
# tipo pode ser "#__VIEWSTATE" ou "#__EVENTVALIDATION"
pegar_tags <- function(req, tipo) {
  req %>% 
    content('text') %>% 
    read_html() %>% 
    html_node(tipo) %>% 
    html_attr('value')
}

# exemplo
viewstate <- pegar_tags(txt, "#__VIEWSTATE")
eventval <- pegar_tags(txt, "#__EVENTVALIDATION")


## dados da requisi????o
sabesp_dados <-  function(data, vs, ev) {
  data <- as.Date(data)
  dados <- list(cmbData = lubridate::day(data),
                cmbMes = lubridate::month(data),
                cmbAno = lubridate::year(data),
                Imagebutton1.x = '0',
                Imagebutton1.y = '0',
                '__VIEWSTATE' = vs,
                '__EVENTVALIDATION' = ev,
                '__VIEWSTATEENCRYPTED' = '')
}

# exemplo
data <- '2017-02-14'
form <- sabesp_dados(data, viewstate, eventval)
# requisicao de busca
result <- POST(link, body = form)

## pegar nomes dos sistemas
sabesp_np_sistemas <- function(r) {
  nomes <- r %>% 
    content('text') %>% 
    read_html() %>% 
    html_nodes() %>% 
    html_attr() %>% 
    keep(~str_detect(.x, '\\.gif$')) %>% 
    map_chr(~str_match(.x, '/(.+\\.gif)'[, 2]))
}


## pegar conte??do da p??gina
sabesp_conteudo <- function(r) {
  nomes <- sabesp_np_sistemas(r)
  r %>% 
    content('text') %>% 
    read_html() %>% 
    html_node('#tabDados') %>% 
    html_table(fill = TRUE) %>% 
    select(titulo = X1, info = X2) %>% 
    filter(titulo != '') %>% 
    mutate(lugar = rep(nomes, each = 4)) %>% #View
    mutate(info = info %>% 
             str_extract('[-0-9, %m]+$') %>% 
             str_replace_all('^[^:]+:', '') %>% 
             str_replace_all(',', '.') %>% 
             str_replace_all('[^0-9]', '') %>% 
             as.numeric()) %>% 
    as_tibble()
}

# exemplo
sabesp_conteudo(result)
