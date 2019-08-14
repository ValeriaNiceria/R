# atribuindo as notas
matematica  <- 88
quimica <- 87.66667
redacao <- 86
arte <- 91.33333
historia <- 84
musica <- 91
educacao_fisica <- 89.33333

# Criando um vetor com as notas
notas_final <- c(matematica, quimica, redacao, arte, historia, musica, educacao_fisica)


# Calculando a média das notas
mean( notas_final )


# Obtendo o dado de um elemento do vetor
notas_final[3]


# Extraindo os elementos com indice de 1 à 4
notas_final[ 1:4]


# Obtendo os valores da posição 1, 3 e 7
notas_final[c(1, 3, 7)]


stem <- notas_final[c(1, 2)]
nstem <- notas_final[c(3:7)]


avg_stem <- mean(stem)
avg_nstem <- mean(nstem)


# Tipo do dado
typeof(notas_final)


# Criando um vetor de caractere
matem_quim <- c('matematica', 'quimica')

# Tipo do dado
typeof(matem_quim)


disciplinas <- c("matemática", "quimica", "redação", "arte", "história", "música", "educação física")
disciplinas


notas_mat_qui <- notas_final[c(1,2)]


# adicionando names ao vetor
names(notas_mat_qui) <- matem_quim
notas_mat_qui

# Retorna os nomes
names(notas_mat_qui)


names(notas_final) <- disciplinas
notas_final


# Pegando a nota de 'arte'
notas_final['arte']


# Obtendo notas de matérias especificas
notas_final[ c('matemática', 'redação', 'música') ]


artes_liberais <- notas_final[ c('redação', 'história') ]
artes_plasticas <- notas_final[ c('arte', 'música') ]

mean(artes_liberais)
mean(artes_plasticas)


# A nota de química foi melhor do que a de matemática?
notas_final['quimica'] > notas_final['matemática']


# A média da notas de artes liberais é maior que a média das notas de artes plásticas?
mean(artes_liberais) > mean(artes_plasticas)


notas_final['matemática'] > notas_final


comparacao_mat <- notas_final['matemática'] > notas_final
comparacao_mat


typeof(comparacao_mat)


gpa <- mean(notas_final)
maior_que_avg <- notas_final > gpa
maior_que_avg


notas_final[ comparacao_mat ]

the_best <- notas_final[ maior_que_avg ]
the_best


provas <- c(76, 89, 78, 88, 79, 93, 89)
exercicios <- c(85, 90, 88, 79, 88, 95, 74)
projetos <- c(77, 93, 87, 90, 77, 82, 80)
materias <- c('matemática', 'química', 'redação', 'arte', 'história', 'música', 'educação.física')


# Aritmética vetoria
soma <- provas + exercicios
soma


notas_maria <- (provas + exercicios + projetos) / 3
names(notas_maria) <- materias
notas_maria

mean(notas_maria)


provas <- c(76, 89, 78, 88, 79, 93, 89)
exercicios <- c(85, 90)
soma <- provas + exercicios
soma


provas <- c(76, 89, 78)
exercicios <- c(85, 90, 88, 79, 88, 95, 74)
projetos <- c(77, 93, 87, 90, 77, 82, 80)
soma_notas_kate <- provas + exercicios + projetos
soma_notas_kate
provas


provas <- c(provas, 76, 89, 78, 99)
provas
exercicios
projetos


soma_notas_kate <- provas + exercicios + projetos
soma_notas_kate


notas_kate <- (soma_notas_kate) / 3
notas_kate


names(notas_kate) <- materias
notas_kate


kate_gpa <- mean(notas_kate)
kate_gpa


notas_kate[notas_kate < kate_gpa]
