# Pacote stringr
install.packages('stringr')
library(stringr)
?stringr


# str_sub() -> extrai apenas parte de um texto ----
cnae.texto <- c('10 Fabricação de produtos alimentícios', '11 Fabricação de bebidas',
                '12 Fabricação de produtos do fumo', '13 Fabricação de produtos têxteis',
                '14 Confecção de artigos do vestuário e acessórios',
                '15 Preparação de couros e fabricação de artefatos de couro, artigos para viagem e calçados',
                '16 Fabricação de produtos de madeira',
                '17 Fabricação de celulose, papel e produtos de papel')
cnae <- str_sub(cnae.texto, 0, 2)
texto <- str_sub(cnae.texto, 4)


# str_replace()
# str_replace_all()
telefones <- c('9931-9512', '8591-5892', '8562-1923')
str_replace(telefones, '-', '')

cnpj <- c('19.702.231/9999-98', '19.498.482/9999-05', '19.499.583/9999-50', '19.500.9999/9999-46')
str_replace_all(cnpj, '\\.|/|-', '')