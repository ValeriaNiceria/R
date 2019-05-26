# A função lm() estima o modelo pelo método denominado de mínimos quadrados ordinários (MQO)

# Para modelo linear com duas variáveis (x e y) e uma constante,
# a fórmula correspondente é:

f <- 'a ~ b'
class(f)

class(as.formula(f))

###################################
# Utilizando a base de dados mtcars.
###################################
data(mtcars)
lm(mpg ~ hp, data = mtcars)

# Incluindo uma constante
lm(mpg ~ hp + 1, data = mtcars)
lm(mpg ~ hp + 0, data = mtcars)


# Incluindo a variável am
lm(mpg ~ hp + am, data = mtcars)


# Incluindo todas as variáveis explicativas
lm(mpg ~ ., data = mtcars)


# Interações
lm(mpg ~ hp + am + hp:am, data = mtcars)


# Transformações
lm(log(mpg) ~ log(hp) + am, data = mtcars)


lm(mpg ~ (am + hp)^2 + hp^2, data = mtcars)
lm(mpg ~ hp + I(hp^2), data = mtcars)


# Variáveis categóricas são convertidas automaticamente para dummies.
library(dplyr)
mtcars <- mtcars %>% 
  mutate(cat = sample(c("a", "b", "c"),
                      size = nrow(mtcars), replace = TRUE))
lm(mpg ~ hp + cat, data = mtcars)


