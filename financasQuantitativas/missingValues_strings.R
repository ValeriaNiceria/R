############################
# Missing Values e Strings #
############################

x <- c(1:3, NA)
is.na(x)
sum(is.na(x))
x <- na.omit(x)


# Vetores de caracteres - strings
x <- c("Um", "Dois", "Três")
length(x)

x[1]
x[2]

pos1 <- x[1]

string1 <- paste(c(x, "Três"), sep = "")
