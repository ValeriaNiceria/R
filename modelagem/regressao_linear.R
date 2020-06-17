library(tidyverse)
library(readxl)
library(knitr)

dados <- readxl::read_xls("dados/BodyFat.xls")

# Distribuição do peso em relação a gordura corporal
ggplot(
  dados,
  aes(x = WEIGHT, y = BODYFAT)
) + geom_point()

# Ajutando o modelo
ajuste <- lm(BODYFAT ~ WEIGHT, data = dados)
summary(ajuste)
str(ajuste, max.level = 1)

coeficiente_modelo <- ajuste$coefficients

# Função predict: Para obter as estimativas do modelo ajustado para uma base de dados nova ou não.
dados$predito_modelo1 <- predict(ajuste, newdata = dados)
dados %>% 
  dplyr::select(WEIGHT, BODYFAT, predito_modelo1) %>% 
  head() %>% 
  kable()


# Calculando o erro quadrático médio
mse <- mean((dados$BODYFAT - dados$predito_modelo1)^2)


# Identificando se o erro é baixo ou não
erro_usando_media <- mean((dados$BODYFAT - mean(dados$BODYFAT))^2)

sqrt(erro_usando_media)
sqrt(mse)


# Adicionando mais variáveis ao modelo
ajuste <- lm(BODYFAT ~ WEIGHT + HEIGHT + CHEST + ABDOMEN + NECK + KNEE, data = dados)

# Calculando o erro do novo modelo
dados$predito_modelo2 <- predict(ajuste, newdata = dados)
dados %>% 
  select(BODYFAT, predito_modelo1, predito_modelo2) %>% 
  head() %>% 
  kable()

mse <- mean((dados$BODYFAT - dados$predito_modelo2)^2)
sqrt(mse)
