# Objetos geométricos

# Dispersão (scatterplot) -> geom_point()
# Gráfico de bolhas -> geom_point()
# Gráfico de barras -> geom_bar() e geom_col()
# Histograma -> geom_histogram()
# Boxplot -> geom_boxplot()
# Densidade -> geom_density()
# Gráfico de linhas -> geom_line()

library(ggplot2)
data("mtcars")

?mtcars
g1 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
  geom_point()

#####################
library(dplyr)

mtcars <- mtcars %>% 
  mutate(name = rownames(mtcars))
ggplot(mtcars, aes(y = mpg, x = disp)) +
  geom_point() +
  geom_smooth()