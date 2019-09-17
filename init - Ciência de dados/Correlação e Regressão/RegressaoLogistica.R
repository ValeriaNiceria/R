# Regressão Logística 
eleicao <- read.csv("dados/Eleicao.csv", sep = ";", header = TRUE)
View(eleicao)

plot(eleicao$DESPESAS, eleicao$SITUACAO)
summary(eleicao)

# Correlação
cor(eleicao$DESPESAS, eleicao$SITUACAO)

# Modelo de regressão logística
modelo <- glm(SITUACAO ~ DESPESAS, data = eleicao, family = "binomial")
modelo
summary(modelo)

# Visualizando os dados e o ajuste do modelo
plot(eleicao$DESPESAS, eleicao$SITUACAO, col = 'red', pch = 20)
points(eleicao$DESPESAS, modelo$fitted, pch = 4)

# Prevendo a probabilidade dos novos candidatos serem eleitos
novaEleicao <- read.csv("dados/NovosCandidatos.csv", sep = ";", header = T)
View(novaEleicao)
novaEleicao$RESULTADO <- predict(modelo, newdata = novaEleicao, type = "response")
View(novaEleicao)


