################################
# Função Summary e Histogramas #
################################

# Pacotes e libraries
# install.packages("data.table")
library(data.table)

# Carregando um arquivo
euro <- fread("./dados/eurusd_h1.csv", header = T, sep = ";")

# Convertendo para dataFrame
euro <- as.data.frame(euro)

# Função summary
summary(euro)


# O histograma dos fechamentos
hist(euro$Close)


# Melhorando a visualização dos histogramas
hist(euro$Close, seq(1.0, 1.3, 0.05))
hist(euro$Close, seq(1.0, 1.3, 0.005))
