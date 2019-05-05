# Mapeamento estético

# Posição (x e y)
# Cor (color)
# Tamanho (size)
# Prenchimento (fill)
# Transparência (alpha)
# Texto (label)

###########################
# Um bloco único de código
##########################
library(ggplot2)
data("mtcars")

ggplot(mtcars) +
  geom_point(aes(x = hp, y = mpg, color = factor(am)),
             size = 3) +
  scale_color_manual("Automatic",
                     values = c("red", "blue"),
                     labels = c("No", "Yes")) +
  labs(title = "Relação entre consumo, potência e tipo de câmbio",
       y = "Consumo",
       x = "Potência")