# Web Scrapping
library(rvest)

html <- read_html("https://pt.wikipedia.org/wiki/Lista_de_redes_de_televis%C3%A3o_do_Brasil")

html.table <- html %>% html_nodes("table")
dados <- html.table[[2]] %>% html_table()

dados <- dados %>% 
  select(-`Rede`)

head(dados)
