# Regressão Linear Simples

# Banco de dados - base do R (cars)
View(cars)

# Verificando se existe uma correlação entre as variáveis
cor(cars)


# Criando um modelo
modelo <- lm(speed ~ dist, data = cars)
modelo

plot(modelo)

plot(speed ~ dist, data = cars)
abline(modelo)


# Como prever?
# previsão = intersecção + (inclinação * valor a prever)

modelo$coefficients

intercept <- modelo$coefficients[1]
dist <- modelo$coefficients[2]
previsao = intercept + dist * 22
previsao


previsao = predict(modelo, data.frame(dist=22))
previsao


# Sumário do modelo
summary(modelo)

# Residuais -> É a distancia entre o ponto dos dados e a linha de melhor ajuste.
modelo$residuals

# Valores ajustados
modelo$fitted.values

plot(modelo$fitted.values, cars$dist)
