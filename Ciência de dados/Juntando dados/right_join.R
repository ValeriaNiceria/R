# Right Outer Join
getwd()
setwd('Ciência de dados/dados')

empregados <- read.csv('Employees.csv')
departamentos <- read.csv('Departments.csv')

final <- departamentos %>% 
  right_join(empregados, by = c('Manager' = 'Employee'))