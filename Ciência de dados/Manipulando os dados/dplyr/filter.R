library(dplyr)
senadores <- read.csv("dados/aposentados.csv")

senadores$Anos.de.Serviço.do.Segurado %>% summary()

senadores_ano_sexo <- senadores %>%
  select(Anos.de.Serviço.do.Segurado, Sexo) %>% 
  filter(Sexo == "Feminino", Anos.de.Serviço.do.Segurado == "32 Anos") %>% 
  distinct() #Semelhante ao unique(), traz registros únicos sem repetição

senadores_ano_sexo