# Funções no R
media = function(objeto){sum(objeto)/length(objeto)}
media(c(1, 2, 3))

alturas = c(2, 4.2, 1.5, 8)
media(alturas)

sum(alturas) # soma do elementos do objeto
length(alturas) # número de elementos do objeto
mean(alturas) # média dos elementos do objeto

# Raiz
sqrt(9)

# Fatorial
factorial(4)

# Apagando o objeto
rm(alturas) # remove(alturas)
alturas

# Apagando todos os objetos
rm(list=ls())
media(4,3,1)

# Listando objeto
ls()
