##########################
# Primeiro algo-traiding #
##########################
library(quantmod)

# Período de análise
startDate <- as.Date("2017-01-01")
endDate <- as.Date("2019-06-05")

# Seleção das variáveis
tickers <- c("^BVSP")

# Captura dos dados
getSymbols(tickers, src = "yahoo", from = startDate, to = endDate)

# Testando com o Ibovespa
# Plotando os gráficos, escala normal e log
chartSeries(BVSP, TA = NULL)
chartSeries(BVSP, TA = NULL, log.scale = TRUE)


#################################################
# Ajustando a maxima e a minima para comparação
BVSP <- as.data.frame(BVSP)

BVSP$High_Shift <- BVSP$BVSP.High
BVSP['High_Shift'] <- c(NA, head(BVSP['High_Shift'], dim(BVSP)[1] - 1)[[1]])
BVSP$Low_Shift <- BVSP$BVSP.Low
BVSP['Low_Shift'] <- c(NA, head(BVSP['Low_Shift'], dim(BVSP)[1] - 1)[[1]])


# Ajustando as regras de compra e venda
BVSP$Bull
