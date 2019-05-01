# Escrevendo CSV
dados <- data.frame(ano = c(2019, 2019, 2019),
                     linguagens = c('R', 'Python', 'JavaScript'),
                     estudou = c('Sim', 'Sim', 'Sim'))

getwd()

# Escrevendo um arquivo de dados em CSV, utilizando função do R base
write.table(dados, file = 'escrevendo_csv.csv')
