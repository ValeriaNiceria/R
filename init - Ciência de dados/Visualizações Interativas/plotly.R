# Plotly

library(plotly)
library(tidyverse)

p <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point()
ggplotly(p)