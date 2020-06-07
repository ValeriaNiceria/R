if (!require(mirt)) install.packages("mirt")

# Lendo os dados
dados <- read_delim("dados/questoes_acerto.csv", delim = ",")

# Criando o primeiro modelo
modelo1 <- mirt::mirt(dados, 1, itemtype = "Rasch")
summary(modelo1)
coef(modelo1, simplify=T, IRTpars=T)  
# a = 'discriminação'
# b = 'dificuldade dos itens'
plot(modelo1)
plot(modelo1, type="info")

# ----------------------------------------

# Modelo - Utilizando 2 parâmetros logísticos
modelo2 <- mirt(dados, 1, itemtype = "2PL")
coef(modelo2, simplify=T, IRTpars=T)
# Curva de característica do teste
plot(modelo2)
# Curva de informação do teste
plot(modelo2, type="info")


# Verificando qual modelo possui melhor ajuste
anova(modelo1, modelo2)
 
# Verificando os fatores
summary(modelo2)


# -------------------------------------------

# Modelo - Utilizando 3 parâmetros logísticos
modelo3 <- mirt(dados, 1, itemtype = "3PL")
coef(modelo3, simplify = T, IRTpars = T)
# g = 'chute'

# Verificando qual modelo possui melhor ajuste
anova(modelo2, modelo3)

# Verificando os modelos utilizando o m² -----------------

# Adicionando mais acelerados no computador
mirtCluster()
M2(modelo1)
M2(modelo2)
M2(modelo3)

plot(modelo3)
plot(modelo3, type = "info")

# Utilizando o erro
modelo3 <- mirt(dados, 1, itemtype = "3PL", SE = T, SE.type = "Richardson")
plot(modelo3, MI=2000)


modelo2 <- mirt(dados, 1, itemtype = "2PL", SE = T, SE.type = "Richardson")
plot(modelo2, MI=2000)

modelo1 <- mirt(dados, 1, itemtype = "Rasch", SE = T, SE.type = "Richardson")
plot(modelo1, MI=2000)


# ---- 
plot(modelo2, type = "trace")
plot(modelo2, type = "infotrace")

variaveis <- c("I2", "I5", "I6", "I7", "I8", "I9", "I14")

dados_itens_informacao <- dados[variaveis]
modelo2_info <- mirt(dados_itens_informacao, 1, itemtype = "2PL", SE = T, SE.type = "Richardson")
coef(modelo2_info)
plot(modelo2_info, MI=2000)
plot(modelo2_info, type = "infotrace")

anova(modelo2, modelo2_info)
M2(modelo2)
M2(modelo2_info)


p1 <- plot(modelo2)
p2 <- plot(modelo2_info)
p3 <- plot(modelo2, type = "infoSE")
p4 <- plot(modelo2_info, type = "infoSE")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, ncol = 2)




