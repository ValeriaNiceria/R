library(dplyr)
if (!require(leaflet)) {install.packages("leaflet")}
library(leaflet)

leaflet() %>% 
  addTiles()

# Primeiro exemplo ----
if (!require(ggmap)) {install.packages("ggmap")}
library(ggmap)
# Utilizada localização da Praça Sete
loc.praca_sete <- data.frame(lon = -43.9385851, lat = -19.9191023)
loc.praca_sete$popup <- "Praça Sete - BH"
leaflet(loc.praca_sete) %>% 
  addTiles() %>% 
  addMarkers(lat = ~lat, lng = ~lon, popup = ~popup)