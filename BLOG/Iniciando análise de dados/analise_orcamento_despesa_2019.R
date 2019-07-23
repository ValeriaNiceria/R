# Carregando os dados do arquivo
dados <- read.csv('2019_OrcamentoDespesa.csv', sep = ';', encoding = 'latin1')

# Conhecendo os dados
# Visualizando os dados
View(dados)

# 5 primeiras linhas dos dados
head(dados)

# 5 últimas linhas dos dados
tail(dados)

# Estrutura dos objetos
str(dados)

# Verificando o nome de todas as colunas
names(dados)

# Verificando o tipo de todas as colunas
lapply(dados, class)

# Verificando o tipo de uma coluna específica
class(dados$EXERCÍCIO)

# Estatística básica de todas as colunas
summary(dados)
