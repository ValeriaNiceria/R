if (!require("rvest")) install.packages("rvest")
require("rvest")


if (!require("devtools")) install.packages("devtools")
library(devtools)


devtools::install_github("Kohze/fireData", force = TRUE)
library("fireData")

api_key <- "AIzaSyDbFkmBkwwL7ZY4ZIIzlBbuF_s4mvn-tiQ"
db_url <- "https://previdencia-projeto.firebaseio.com"
project_id <- "previdencia-projeto"
project_domain <- "previdencia-projeto.firebaseapp.com"


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
for (indice in 1:length(links)) {
  page <- read_html(paste("http://dadosabertos.dataprev.gov.br", links[indice], sep=""))
  titulo <- text_links[indice]
  
  print(titulo)
  
  # Descrição
  descricacao <-
    page %>%
    html_node(".embedded-content p") %>%
    html_text()
  
  
  # Informaçõe Adicionais
  informacoes <-
    page %>%
    html_table()
  
  
  campo <- informacoes[[1]]['Campo']
  valor <- informacoes[[1]]['Valor']
  
  autor <- valor$Valor[1]
  mantenedor <- valor$Valor[2]
  frequencia_de_atualizacao <- valor$Valor[3]
  cobertura_geografica <- valor$Valor[4]
  documentacao <- valor$Valor[5]
  granularidade_geografica <- valor$Valor[6]
  granularidade_temporal <- valor$Valor[7]
  vcge <- valor$Valor[8]
  
  
  # CSV
  url_csv <-
    page %>%
    html_node(".dropdown ul .resource-url-analytics") %>%
    html_attr("href")
  
  print(url_csv)
  
  data_csv <- read.csv(url_csv, na.strings = '-', stringsAsFactors = FALSE, fileEncoding = 'latin1')
  
  # cabeçalho
  names(data_csv)
  
  # 2 primeiras linhas do dataframe
  head(data_csv, n = 2L)
  
  # Ajuda
  ?head
  
  # Número de colunas do dataframe
  # num_column <- length(colnames(data_csv))
  
  # for (column in 1:num_column) {
  #   cabecalho <- names(data_csv[column])
  #   tipo <- lapply(data_csv[column], class)
  #   
  #   if (tipo[1] == "character") {
  #     resultado <- data.frame(table(data_csv[column]))
  #     fireData::put(resultado, projectURL = db_url, directory = titulo, title = cabecalho)
  #   } else if (tipo[1] == "integer") {
  #     resultado <- lapply(data_csv[column], summary)$cabecalho
  #     fireData::put(resultado, projectURL = db_url, directory = titulo, title = cabecalho)
  #   }
  #   
  # }
}






# http://dadosabertos.dataprev.gov.br/
# http://dados.gov.br/organization/previdencia
# http://www.previdencia.gov.br/dados-abertos/


# > source("main.r", echo=TRUE, print.eval=TRUE)
# https://stackoverflow.com/questions/41721154/r-jsonlite-create-json-data-in-a-specific-format
