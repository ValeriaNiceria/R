library(dplyr)

# Cruzamento de dados (Join)
# Inner Join (ou apenas Join)
band_members
band_instruments

str(band_members)
str(band_instruments)

# juntando dois conjuntos com um join e o dplyr "adivinhou" a coluna chave
band_members %>% 
  inner_join(band_instruments)


band_instruments2
str(band_instruments2)

band_members %>% 
  inner_join(band_instruments2,
             by = c('name' = 'artist'))

# Mais um exemplo ----
getwd()
setwd('Ciência de dados/dados')

empregados <- read.csv('Employees.csv')
departamentos <- read.csv('Departments.csv')

str(empregados)
str(departamentos)

final <- empregados %>% 
  inner_join(departamentos,
             by = c('Employee' = 'Manager'))