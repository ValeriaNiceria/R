# Regressão Linear Múltipla

# Banco de dados - base do R (mtcars)
View(mtcars)
colnames(mtcars)
rownames(mtcars)
dim(mtcars)


# Modelo de regressão linear simples
cor(mtcars[1:4])

modelo <- lm(mpg ~ disp, data = mtcars)
modelo

# Coeficiente de determinação
summary(modelo)$r.squared

# Coeficiente de determinação (ajustado)
summary(modelo)$adj.r.squared

plot(mpg ~ disp, data = mtcars)
# gerar linha de melhor ajuste
abline(modelo)

# Fazendo previsões
predict(modelo, data.frame(disp=200))


# Modelo de regressão linear múltipla
modelo <- lm(mpg ~ disp + hp + cyl, data=mtcars)
modelo

# Coeficiente de determinação (R²)
summary(modelo)$r.squared

# Coeficiente de determinação ajustado
summary(modelo)$adj.r.squared

# Fazendo a previsão
predict(modelo, data.frame(disp=200, hp=100, cyl=4))
