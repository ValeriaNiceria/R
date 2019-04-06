# Funções úteis em dataframe:
# head() - Mostra as primeiras 6 linhas
# tail() - Mostra as últimas 6 linhas
# dim() - Número de linhas e de colunas
# names() - Os nomes das colunas (variáveis)
# str() - Estrutura do data.frame. Mostra, entre outras coisas, as classes de cada coluna
# cbind() - Acopla duas tabelas lado a lado
# rbind() - Empilha duas tabelas

# Transformando uma lista em um dataframe
minha_lista <- list(x = c(1, 2, 3), y = c("a", "b", "c"))
as.data.frame(minha_lista)
