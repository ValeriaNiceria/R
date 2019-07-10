# dygraphs

ts(data = NA, start = 1, end = numeric(), frequency = 1,
   deltat = 1, ts.eps = getOption("ts.eps"), class =, names = )


####################
x <- rnorm(24, mean = 100, sd = 10)
# Transformando em série mensal a partir de janeiro de 2010
x <- ts(x, freq = 12, start = c(2010, 1))
plot(x)

#######################
library(xts)
xts_df <- data.frame(y = rnorm(365, 100, 10))
xts_df$data <- seq.Date(as.Date("2011-01-01"),  length.out = 365, by = "1 day")
xts_df <- xts(x = xts_df[, "y"], order.by = xts_df[, "data"])
head(xts_df)

if (!require(dygraphs)) {install.packages("dygraphs")}
library(dygraphs)
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths,
        main = "Mortes por Doenças Pulmonares - Reino Unido - 1874-1979",
        ylab = "Número de Mortes") %>% 
  dySeries("mdeaths", color = "blue", label = "Homens") %>% 
  dySeries("fdeaths", color = "green", label = "Mulheres") %>% 
  dyRangeSelector()