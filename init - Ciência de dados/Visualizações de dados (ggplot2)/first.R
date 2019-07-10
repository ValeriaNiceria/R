install.packages("ggplot2")
library(ggplot2)

data("mtcars")

# Inicia o plot
g <- ggplot(mtcars)

# Adicionar pontos (geom_point) e
# vamos mapear variáveis a elementos estéticos dos pontos
# size = 3 define o tamanho de todos os pontos
g <- g + geom_point(aes(x = hp, 
                        y = mpg,
                        color = factor(am),
                        size = 3))

# Altera a escala de cores
g <- g + scale_color_manual("Automatic",
                            values = c("red", "blue"),
                            labels = c("No", "Yes"))

# Rótulos (títulos)
g <- g + labs(title = "Relação entre consumo, potência e tipo de câmbio",
              y = "Consumo",
              x = "Potência")
