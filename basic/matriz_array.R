# Matriz
matrix(1:100, nrow=20, ncol=5)

# Array
array(1:100, dim=c(5, 5, 4))

# Criando objetos vazios
a = rep(NA, 10)
a
b = matrix(NA, nrow=3, ncol=3)
b
c = array(NA, dim=c(3,3,3))
c

#Preenchendo os lugares vazios
a[1] = 5
a

b[3, 2] = 'Oi'
b

c[3, 3, 1] = "Ol�"
c