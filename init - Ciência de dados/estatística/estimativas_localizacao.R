state <- read.csv("init - Ciência de dados/estatística/state.csv")

# Média
mean(state$Population)

# Média aparada
mean(state[['Population']], trim=0.1)

# Mediana
median(state$Population)

# Média ponderada
weighted.mean(state$Murder.Rate, w=state$Population)

# Mediana ponderada 
library(matrixStats)
weightedMedian(state$Murder.Rate, w=state$Population)
