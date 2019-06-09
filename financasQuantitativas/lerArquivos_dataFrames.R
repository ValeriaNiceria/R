##############################
# Ler Arquivos e Data Frames #
##############################

# Pacotes ou libraries
install.packages("data.table")
library(data.table)


# Carregando um arquivo
euro <- fread("./dados/eurusd_h1.csv", header = TRUE, sep = ";")
class(euro)

# Convertendo para DataFrame
euro <- as.data.frame(euro)

# Conhecendo sua base de dados
dim(euro)
names(euro)


# Acessando o dataset
names(euro)[1]
euro[1]
euro[100, 1]
