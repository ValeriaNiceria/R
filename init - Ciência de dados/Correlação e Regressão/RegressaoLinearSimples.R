# Regressão Linear Simples
library(dplyr)

# Banco de dados - base do R (cars)
cars %>% View()

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
