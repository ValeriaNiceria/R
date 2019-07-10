library(dplyr)
# Full Outer Join

band_members %>% 
  full_join(band_instruments2,
            by = c('name' = 'artist'))

# Outro exemplo ----
getwd()
setwd('Ciência de dados/dados')

empregados <- read.csv('Employees.csv')
departamentos <- read.csv('Departments.csv')

final <- departamentos %>% 
  full_join(empregados,
            by = c('Manager' = 'Employee'))