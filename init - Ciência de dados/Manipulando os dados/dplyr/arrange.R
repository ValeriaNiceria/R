# Arrange
install.packages("nycflights13")
library(nycflights13)
data("flights")

media <- flights %>% 
  group_by(month) %>% 
  summarise(arr_delay_media = mean(arr_delay, na.rm=TRUE),
            dep_delay_media = mean(dep_delay, na.rm=TRUE)) %>% 
  arrange(dep_delay_media)


media
