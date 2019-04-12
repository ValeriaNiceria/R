install.packages(c("rvest", "dplyr"))

require(rvest)
library(dplyr)
library(stringr)


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
  
  # Criando um dataframe com as informações adicionais
  dataframe_info_adicional <- data.frame("autor" = autor, 
                                         "mantenedor" = mantenedor, 
                                         "frequencia_de_atualizacao" = frequencia_de_atualizacao,
                                         "cobertura_geografica" = cobertura_geografica,
                                         "documentacao" = documentacao,
                                         "granularidade_geografica"= granularidade_geografica,
                                         "granularidade_temporal" = granularidade_temporal,
                                         "vcge" = vcge)
  
  
  # CSV
  url_csv <-
    page %>%
    html_node(".dropdown ul .resource-url-analytics") %>%
    html_attr("href")
  

  data_csv <- read.csv(url_csv, na.strings = '-', stringsAsFactors = FALSE, fileEncoding = 'latin1')
  
  # Verificando se o arquivo é xml
  if (grepl(url_csv, 'format=xml')) {
    data_csv <- read_xml(url_csv, na.strings = '-', stringsAsFactors = FALSE)
  }
  
  
  # cabeçalho
  names(data_csv)
  
  # 2 primeiras linhas do dataframe
  head(data_csv, n = 2L)
  
  # Ajuda
  # ?head
  
  # Número de colunas do dataframe
  num_column <- length(colnames(data_csv))
  
  
  for (column in 1:num_column) {
    cabecalho <- names(data_csv[column])
    
    # Tratando a coluna - substituindo valores
    coluna_tratada <- data_csv[column] %>% 
      mutate(new_column = str_replace_all(data_csv[[cabecalho]], c("R$" = "", "-" = "", "nan" = "", ',' = '.'))) %>% 
      na.omit()
    
    # Transformando a coluna em numerico
    coluna_alterada_tipo <- as.numeric(coluna_tratada$new_column)
    
    # Atribuindo o primeiro valor da lista a uma variável
    primeiro_valor_coluna <- coluna_alterada_tipo[1]
    
    
    if (is.na(primeiro_valor_coluna)) {
      resultado <- table(data.frame(coluna_tratada$new_column))
      print(resultado)
    } else {
      resultado <- lapply(data.frame(coluna_alterada_tipo), summary)
      print(resultado)
    }
    
    
  }
}






# http://dadosabertos.dataprev.gov.br/
# http://dados.gov.br/organization/previdencia
# http://www.previdencia.gov.br/dados-abertos/


# > source("main.r", echo=TRUE, print.eval=TRUE)
# https://stackoverflow.com/questions/41721154/r-jsonlite-create-json-data-in-a-specific-format
