# * @get / solta
amostrar_filmes <- function() {
  dados %>% 
    sample_n(10)
}

