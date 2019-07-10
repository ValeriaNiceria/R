# União de dados (Union)
dados2016 <- data.frame(ano = c(2016, 2016, 2016),
                        valor = c(938, 113, 1748),
                        produto = c('A', 'B', 'C'))

dados2017 <- data.frame(valor = c(8400, 837, 10983),
                        produto = c('H', 'Z', 'X'),
                        ano = c(2017, 2017, 2017))

dados.finais <- rbind(dados2016, dados2017)