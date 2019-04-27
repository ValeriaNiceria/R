# Loops

# For
for (i in c(1, 2, 3, 4, 5, 6)) {
  print(i^2)
}


for (i in 1:1000) {
  if ((i %% 29 == 0) & (i %% 3 == 0)) {
    print(i)
  }
}


# While
i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

automatico <- list.files('dados/automatico/')
while (length(automatico) == 0) {
  automatico <- list.files('dados/automatico/')
  if (length(automatico) > 0) {
    print('O arquivo chegou!')
    print('Inicia a leitura dos dados')
    print('Faz a manipulação')
    print('Envia email informando conclusão dos cálculos')
  } else {
    print('aguardando arquivo...')
    Sys.sleep(5)
  }
}