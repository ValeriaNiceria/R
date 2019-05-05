# Escalas
# Variáveis contínuas
install.packages("ISLR")
library(ISLR)
library(ggplot2)

ggplot(Wage,
       aes(x = age,
           y = wage,
           color = education)) +
  geom_point() +
  scale_x_continuous("Idade",
                     breaks = seq(0, 80, 5),
                     expand = c(0, 5)) +
  scale_y_continuous("Salário",
                     labels = function(x) paste("US$", x),
                     limits = c(0, 400))