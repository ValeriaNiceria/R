## Amostra aleat??ria simples
dim(iris)

amostra = sample(c(0, 1), 150, replace = TRUE, prob = c(0.5, 0.5))

length(amostra[amostra == 1]) # Quantidade de valores 1
length(amostra[amostra == 0]) # Quantidade de valores 0

set.seed(2345)
sample(c(100), 1) # 12


## Amostra estratificada
summary(iris)
# install.packages("sampling")
library(sampling)

amostra_iris2 = strata(iris, c("Species"), size = c(25, 25, 25), method = "srswor")
summary(amostra_iris2)

infert # dataframe
dim(infert)
summary(infert)

# method = "srswor" => gera uma amostra aleat??ria sem reposi????o
# outros met??dos
help(strata)
12 / 248 * 100
120 / 248 * 100
116 / 248 * 100
amostra = strata(infert, c("education"), size = c(5, 48, 47), method = "srswor")
summary(amostra)


## Amostragem sistem??tica
# install.packages("TeachingSampling")
library(TeachingSampling)
amostra = S.SY(150, 10) # total da popula????o e depois o intervalo
amostra

amostra_iris = iris[amostra,] # pega no dataframe iris somente as linha que foram geradas anteriormente
