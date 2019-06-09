################################
# Criando e Manipulando Listas #
################################

# Criando a lista
lista <- list(ativo = "EURUSD", 
              semana = "JAN04", 
              n_pregao = 4,
              precos = c(1.75, 1.76, 1.73))


# Acessando dados dentro da lista
lista[1]

lista[[1]]
lista$ativo

lista$precos
mean(lista$precos)
lista[[4]]
lista[[4]][1]
