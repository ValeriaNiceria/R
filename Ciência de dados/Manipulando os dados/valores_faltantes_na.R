# Valores faltantes e o 'NA'

# Funções úteis para lidar com NA
# - summary()
# - is.na()
# - complete.cases()
# - na.rm

# Carregando uma base de dados pré-carregada no R
data("airquality")
summary(airquality)

is.na(airquality$Ozone)
