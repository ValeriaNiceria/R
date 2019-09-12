vector(mode = "character", length = 5)
vector(mode = "numeric", length = 5)
vector(mode = "logical", length = 5)

c("Marx", "Weber", "Durkheim")
c(5, 4, 3, 2, 1)
c(TRUE, FALSE, TRUE)

# Sequência
1:4
3:9
10:1
seq(2, 10, 2)

# repetição
rep("texto", 5)
rep(c(1, 2, 3), 3)


# factor
codigo <- c(23, 22, 23, 23, 22, 22, 23, 22)
uf <- factor(codigo, levels = c(22, 23), labels = c("Piauí", "Ceará"))
uf
levels(uf)

idh05 <- c(0.677, 0.742, 0.723)
names(idh05) <- c("AL", "BA", "CE")

# Número de elementos
length(idh05)

mode(idh05)
class(idh05)

# informações sobre o objeto
summary(idh05)

# Média
mean(idh05)

# Mediana
median(idh05)

# Valor mínimo
min(idh05)

# Valor máximo
max(idh05)

# Os quartis de um vetor
quantile(idh05)

# Soma
sum(idh05 > 0.73)

# Informações sobre o objeto
str(idh05)

# O código necessário para gerar o objeto
dput(idh05)
dput(uf)

x <- c(1, 2, 3, 3)
y <- c(1, 9, 8, 5)
x + y
