# Um vetor tem sempre a mesma classe dos objetos que guarda
vetor1 <- c(1, 2, 3, 4, 5)
vetor2 <- c("a", "b", "c", "d", "e")
vetor3 <- 1:4

class(vetor1)
class(vetor2)

# Fazendo operações com vetores
vetor1 - 1
vetor1 * 10
vetor1 * vetor1


# Ordem de precedência é:
# character > complex > numeric > integer > logical

y <- c(1.7, "a")
class(y)

# Forçando classes explicitamente
# as.character()
# as.numeric()
# as.integer()
# as.logical()

x <- 0:4
class(x)
x <- as.numeric(x)
class(x)
x <- as.logical(x)
class(x)
x <- as.character(x)
class(x)

x <- c("a", "b", "c", "d")
class(x)
x <- as.numeric(x)
class(x)
