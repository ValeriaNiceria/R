########################
# Construindo Gráficos #
########################

# Pacotes e libraries
# ggplot2
# quantmod
library(data.table)

# Carregando um arquivo
euro <- fread("./dados/eurusd_h1.csv", header = T, sep = ";")
class(euro)

# Plotando um gráfico
plot(euro$Close)
plot(euro$Close, col = "blue", type = "l")
plot(euro$Close, col = "blue", type = "l",
     main = "Gráfico EUR/USD - H1",
     xlab = "Tempo",
     ylab = "Preço")


# Tendência
x <- 1:nrow(euro)
abline(lm(euro$Close ~ x), col = "red")
abline(h = mean(euro$Close), col = "black")
