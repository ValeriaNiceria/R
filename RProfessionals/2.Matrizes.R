harvard <- c(1, 1, 1, 1, 3)
stanford <- c(2, 9, 3, 4, 10)
mit <- c(3, 3, 2, 2, 1)
cambridge <- c(4, 2, 6, 13, 48)
oxford <- c(5, 7, 12, 9, 15)
columbia <- c(6, 13, 13, 12, 5)


# Combinando vários vetores por linha - rbind
harv_stan <- rbind( harvard, stanford )
harv_stan


rbind(harv_stan, mit)


uni_matrix <- rbind(harv_stan, mit, cambridge, oxford, columbia)
uni_matrix


# Adicionar nomes
# Linhas = rownames()
# Colunas = colnames()


colunas <- c('world.rank', 'quality.of.education', 'influence', 'broad.impact', 'patents')
colnames(harv_stan) <- colunas
harv_stan


rownames(harv_stan)

colnames(uni_matrix) <- colunas
uni_matrix


valor_anual <- c(43280, 45000, 45016, 49350, 28450, 55161)


# Tamanho da matriz
dim(uni_matrix)


# Número de linhas
dim(uni_matrix)[1]

# Verificando se possuem o mesmo tamanho
dim(uni_matrix)[1] == length(valor_anual)


# Combinando vetores por coluna - cbind
uni_matrix <- cbind(uni_matrix, valor_anual)
uni_matrix


# Extraindo valor da matriz
patents_stanford <- uni_matrix[2, 5]
patents_stanford


patents_stanford <- uni_matrix['stanford', 'patents']
patents_stanford


stanford <- uni_matrix['stanford', 3:5]
stanford



uni_matrix[c('oxford', 'harvard'), c('quality.of.education', 'valor_anual')]


oxford_influence <- uni_matrix['oxford', 'influence']
oxford_influence


cam_stan_patents <- uni_matrix[c('cambridge', 'stanford'), 'patents']
cam_stan_patents


uni_matrix['harvard',]
uni_matrix[, 'valor_anual']
uni_matrix[, c('influence', 'broad.impact')]


oxford_rank <- uni_matrix['oxford',]
oxford_rank


influence <- uni_matrix[, 'influence']
influence



harv_mit_rank <- uni_matrix[c('harvard', 'mit'),]
harv_mit_rank



influence_patents <- uni_matrix[, c('influence', 'patents')]
influence_patents


rank( uni_matrix[, 'quality.of.education'] )
