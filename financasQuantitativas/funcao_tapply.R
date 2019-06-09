#################
# Função tapply #
#################

state <- c("tas", "sa", "qld", "nsw", "nt", "wa",  "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
           "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
           "sa", "act", "nsw", "vic", "vic", "act")


statef <- factor(state)


incomes <- c(60, 49, 40, 61, 64, 59, 62, 69, 70, 42, 56, 45, 82,
             61, 61, 58, 48, 49, 41, 48, 52, 46, 59, 46, 58, 43,
             59, 46, 58)

# Função tapply
inc_means <- tapply(incomes, statef, mean)


# Função customizada
strderr <- function(x) sqrt(var(x)/length(x))

inc_str <- tapply(incomes, statef, strderr)
