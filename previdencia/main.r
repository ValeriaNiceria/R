if (!require("rvest")) install.packages("rvest")
require("rvest")


if (!require("devtools")) install.packages("devtools")
library(devtools)


devtools::install_github("Kohze/fireData", force = TRUE)
library("fireData")

# api_key <- Sys.getenv("AIzaSyDbFkmBkwwL7ZY4ZIIzlBbuF_s4mvn-tiQ")
# db_url <- Sys.getenv("https://previdencia-projeto.firebaseio.com")
# project_id <- Sys.getenv("previdencia-projeto")
# project_domain <- Sys.getenv("previdencia-projeto.firebaseapp.com")

fireData::put(x = mtcars, projectURL = db_url, directory = "new")

##=========
text_links <- c()
links <- c()
for (page in 1:7) {
  main_page <- read_html(paste("http://dadosabertos.dataprev.gov.br/dataset?tags=Previd%C3%AAncia+Social&page=", page, sep=""))
 
  text_link <-
    main_page %>%
    html_nodes(".dataset-heading a") %>%
    html_text()

  text_links <- c(text_links, text_link)

  link <-
    main_page %>%
    html_nodes(".dataset-heading a") %>%
    html_attr("href")

  links <- c(links, link)
}



##==========
descricoes <- c()
for (indice in 1:length(links)) {
  page <- read_html(paste("http://dadosabertos.dataprev.gov.br", links[indice], sep=""))
  
  # Descrição
  descricacao <-
    page %>%
    html_node(".embedded-content p") %>%
    html_text()
  
  descricoes <- c(descricoes, descricacao)
  
  
  # Informaçõe Adicionais
  informacoes <-
    page %>%
    html_table()
  
  
  campo <- informacoes[[1]]['Campo']
  valor <- informacoes[[1]]['Valor']
  
  autor_valor <- valor$Valor[1]
}






# http://dadosabertos.dataprev.gov.br/
# http://dados.gov.br/organization/previdencia
# http://www.previdencia.gov.br/dados-abertos/


