install.packages("tidyr")
library(tidyr)

library(tidyverse)

?tidyr

# Funções
# gather() -> serve para agrupar duas ou mais colunas e seus respectivos valores em pares. ----
data("USArrests")
str(USArrests)
head(USArrests)

# Transforma o nome das linhas em colunas
USArrests$State <- rownames(USArrests)
head(USArrests)

usa.long <- USArrests %>% 
  gather(key = "tipo_crime", value = "valor", -State)

head(usa.long)
tail(usa.long)

# spread() -> Espalha os valores de duas colunas em diversos campos para cada registro:  ----
#  Os valores de uma coluna viram o nome  das novas colunas, e os valores de outra viram valores de cada registro nas novas colunas.
head(table2)

table2.wide <- table2 %>% 
  spread(key = type, value = count)

head(table2.wide)

# separate()  -> É usado para separar duas variáveis que estão  em uma mesma coluna. ----
head(table3)

table3.wide <- table3 %>% 
  separate(rate, into = c("cases", "population"), sep="/")

head(table3.wide)


# Unite - Pega duas colunas e transforma em uma só. ----
table2.relatorio <- table2 %>%
  unite(type_year, type, year) %>% 
  spread(key = type_year, value = count, sep = '_')

