library(dplyr)
# Left Outer Join

band_members %>% 
  left_join(band_instruments2,
            by = c('name' = 'artist'))

# Outro exemplo ----
getwd()
setwd('Ciência de dados/dados')

empregados <- read.csv('Employees.csv')
departamentos <- read.csv('Departments.csv')

final <- empregados %>% 
  left_join(departamentos,
            by = c('Employee' = 'Manager'))