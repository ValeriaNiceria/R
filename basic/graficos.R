# Gr�ficos no R

#Fun��o pie()
num = c(1, 7, 2, 3) # valores
tex = c("Maria", "Ana", "Jos�", "Carlos") # label
pie(num, tex) # Gera um gr�fico de pizza


# Fun��o plot()
plot(1:10, 10:1)
plot(1:10, 10:1, pch=2) # altera o simbolo do ponto
plot(1:10, 10:1, pch=2, col=3) # muda a cor do ponto
plot(1:10, 10:1, pch=2, col=3, xlab="eixo x")
plot(1:10, 10:1, pch=2, col=3, xlab="eixo x", ylab="eixo y")

plot(1:10, c(2, 3, 4, 7, 3, 5, 6, 8, 2, 4), type="s")