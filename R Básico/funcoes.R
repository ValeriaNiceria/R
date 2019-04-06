mean(1:10) # calcula a média
round(pi) # arredonda um número


# Criando suas próprias funções
soma <- function(x, y = 0) {
    resposta <- x + y
    return(resposta)
}

# usando a função criada
soma(10, 5)

soma(3)
