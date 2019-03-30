if (!require(rvest)) install.packages("rvest")

require(rvest)


# Título
page <- read_html("http://dados.gov.br/dataset/aposentadorias-concedidas-por-anos-de-servico")
titulo <- 
  page %>%
  html_node(".module-content h1") %>%
  html_text()

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


#http://dadosabertos.dataprev.gov.br/
#http://dados.gov.br/organization/previdencia
#http://www.previdencia.gov.br/dados-abertos/
