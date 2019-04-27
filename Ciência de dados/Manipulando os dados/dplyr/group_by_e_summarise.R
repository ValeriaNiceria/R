# Group By e Summarise
install.packages("nycflights13")
library(nycflights13)
data("flights")

names(flights)
str(flights)

# Obter a média de atraso da chegada para cada mês
media <- flights %>% 
  group_by(month) %>% 
  summarise(arr_delay_media = mean(arr_delay, na.rm = TRUE),
            dep_delay_media = mean(dep_delay, na.rm = TRUE))

media
