# Tipos de variáveis e colunas
# Vetor
vetor.chr <- c('tipo1', 'tipo2', 'tipo3', 'tipo4')
vetor.num <- c(1, 2, 5, 7, 100)
vetor.num.repetidos <- c(rep(2, 50)) # usando função para repetir números
vetor.num.sequencia <- c(seq(from=0, to=100, by = 5)) # usando função para criar sequências
vetor.logical <- c(TRUE, TRUE, TRUE, FALSE, FALSE)

# DataFrame
nome <- c('João', 'José', 'Maria', 'Joana')
idade <- c(45, 12, 28, 31)
adulto <- c(TRUE, FALSE, TRUE, TRUE)
uf <- c('DF', 'SP', 'RJ', 'MG')

# cada vetor é uma combinação de elementos de um MESMO tipo de dados
# sendo assim, cada vetor pode ser uma coluna de um data.frame

clientes <- data.frame(nome, idade, adulto, uf)


# Conversões de tipos de variáveis
sa
