# Rdata

participantes <- data.frame(
  Nome = c('Carlos', 'Maurício', 'Ana Maria', 'Rebeca', 'Patrícia'),
  Estado = c('Brasília', 'Minas Gerais', 'Goiás', 'São Paulo', 'Ceará'),
  Idade = c(23, 24, 22, 29, 28)
)

save(participantes, file = 'participantes.Rdata')

rm(participantes) # removendo o objeto

# Carregando o arquivo gerado
load('participantes.Rdata')
str(participantes)
