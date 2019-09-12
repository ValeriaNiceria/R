sexo <- c("Masculino", "Feminino", "Feminino", "Masculino", "Feminino")
idade <- c(40, 37, 17, 13, 10)
estado.civil <- c("casado", "casado", "solteiro", "solteiro", "solteiro")

b <- data.frame(sexo, idade, estado.civil)

# Sumário de uma coluna
summary(b$estado.civil)

# Alterando um valor de uma coluna
b$estado.civil[3] <- "casado"
