# Escalas

ggplot(iris,
       aes(x = Petal.Length,
           y = Petal.Width,
           color = Species)) +
  geom_point()


# Alterando a escala de cor
ggplot(iris,
       aes(x = Petal.Length,
           y = Petal.Width,
           color = Species)) +
  geom_point() +
  scale_color_manual(values = c("orange", "black", "red"))


####################################
ggplot(iris,
       aes(x = Petal.Length,
           y = Petal.Width,
           color = Species)) +
  geom_point() +
  scale_color_manual(values = c("orange", "black", "red")) +
  scale_x_continuous(name = "Petal Length", breaks = 1:7) +
  scale_y_continuous(name = "Petal Width", breaks = 0:3, limits = c(0, 3))