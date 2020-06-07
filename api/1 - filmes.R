# opencpu
# plumber


# Criar API plumber, necessário:
# - Uma função que executa uma ação
# - Uma documentação da função
# - Selecionar uma porta para disponibilizar a api
if (!require(plumber)) install.packages("plumber", dependencies = T)
library(plumber)

# Rodar exemplo api usando plumber
p <- plumber::plumb("R/funcoes_api.R")
p$run(port = 8080, host="127.0.0.1")

# curl -X GET "http://127.0.0.1:8080/amostrar_filmes"
# curl --data "orcamento=10000&ano=1991" "http://localhost:8080/prever_nota_filme"


