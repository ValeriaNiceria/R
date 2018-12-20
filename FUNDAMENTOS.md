## Fundamentos em R  📚

### Instalação de pacote - linha de comando
`install.packages("devtools", dependencies=TRUE)`


### Carregar e descarregar - pacote
`library(devtools)` 

`detach("package:devtools", unload=TRUE)`


### Diretório de trabalho
> Saber o diretório padrão `getwd()`

> Alterar o diretório padrão `setwd("c:\\...")`

### Encerrando o R
`quit()`


### Classes -> retorna o tipo do Objeto
`class(iris)`


### Salvando e carregando Objetos
`save(objetos, file="arquivo.Rdata")` 

`load(file="arquivo.Rdata")`


### Visualização de Dados
`plot()`  -  `hist()`  -  `boxplot()`