# IF e ELSE
x <- 2
if (x < 0) {
    sinal <- "negativo"
} else if (x == 0) {
    sinal <- "neutro"
} else if (x > 0 ) {
    sinal <- "positivo"
}

sinal
Sys.time() # Devolve a data/hora no momento da execução

# FOR
x <- 1:10
soma <- 0

for (i in x) {
    soma = soma + x[i]
}

soma
sum(x)


vetor <- 30:35
indices <- seq_along(vetor)

for (i in indices) {
    print(vetor[1:i] / 2)
}
