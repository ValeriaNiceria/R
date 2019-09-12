# Carregando arquivo SAV
library(foreign)
b <- read.spss("../RparaCS-dados/bd_exemplo.sav", to.data.frame = TRUE)
View(b)

# Acessando os valores dos atributos
attr(b, "variable.labels")


# Carregando arquivo CSV
library(descr)
file.head("../RparaCS-dados/bd_exemplo1.csv")
b1 <- read.table("../RparaCS-dados/bd_exemplo1.csv", header = TRUE, sep = " ", 
                 dec = ",", quote = '"')

View(b1)
summary(b1)
