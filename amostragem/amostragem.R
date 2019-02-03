iris
dim(iris)

# Gerar valores aleatórios - usando a função sample()
# Primeiro o conjunto de dados
# Depois a quantidade de números aleatórios
# Informar se é com reposição ou não
# Por último o vetor de probabilidade
amostra = sample(c(0,1), 150, replace = TRUE, prob = c(0.5, 0.5))
amostra

tamanhoAmostraUm = length(amostra[amostra==1])
tamanhoAmostraUm

tamanhoAmostraZero = length(amostra[amostra==0])
tamanhoAmostraZero


# Gerar amostra extratificada
