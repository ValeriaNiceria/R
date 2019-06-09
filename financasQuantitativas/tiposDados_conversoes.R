###############################
# Tipos de dados e Conversões #
###############################

# Tipos de dados: numeric, logical, complex, character e factor

z <- 0:9
class(z)

d <- as.character(z)
class(d)

digitos <- as.integer(d)
class(digitos)

fatores <- as.factor(digitos)
class(fatores)
