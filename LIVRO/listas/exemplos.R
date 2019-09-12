numeros <- c(1, 2, 3)
lista <- list(numeros, letras = c("a", "b", "c", "d"), c(TRUE, FALSE))

# Acessar elementos da lista
lista$letras

lista['letras']

lista[['letras']]

lista[3]

lista[[3]]

# Tipo
c(class(lista['letras']), class(lista[['letras']]), class(lista$letras))

# selecionando vários elementos da lista
lista[c(1, 3)]

lst <- list(c("aa", "bb", "cc"), c(1, 2, 3, 4), c(1.1, 1.2, 1.3))
names(lst) <- c("Texto", "Numeros.inteiros", "Numeros.reais")
lst$Texto
lst$Numeros.inteiros
lst$Numeros.reais
