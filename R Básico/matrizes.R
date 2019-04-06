# Matrizes são vetores de duas dimensões
m <- matrix(1:6, nrow = 2, ncol = 3)
dim(m)

# Operações úteis
m[,3] # seleciona a terceira coluna
m[2,] # seleciona a segunda linha
t(m) # matriz transposta
