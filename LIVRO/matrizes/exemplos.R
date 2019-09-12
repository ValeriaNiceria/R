# cbind() => juntar colunas
# rbind() => juntar linhas

x <- c(7, 9, 8, 10, 1)
y <- c(9, 8, 10, 9, 3)
z <- c(10, 9, 9, 9, 2)

cbind(x, y, z)
rbind(x, y, z)

m <- cbind(x, y, z)
colnames(m) <- c("Matemática", "Português", "História")
rownames(m) <- c("Helena", "José", "Maria", "Franscico", "Macunaíma")

# acessando os dados
m[5, 3]
m[1:3, 2]
m[c(1, 4), 1]
m["Maria", c("Português", "Matemática")]
m[, "História"]
m["Macunaíma",]
m["Macunaíma", "Português"] <- 4
