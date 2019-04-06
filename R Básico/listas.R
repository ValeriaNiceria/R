# Listas são um tipo especial de vetor que aceita elementos de classes diferentes
x <- list(1:5, 'z', TRUE, c("x", "z"))

is.list(x)
as.list(x)


pedido <- list(pedido_id = 0909090,
                pedido_registro = as.Date("2019-04-06"),
                nome = "Tereza",
                cpf = "12345678900",
                itens = list(
                    list(descricao = "Ferrari",
                        frete = 0,
                        valor = 500000),
                    list(descricao = "Dolly",
                        frete = 1.5,
                        valor = 3.90)
                )
            )
            
# Operações úteis
pedido$cpf
pedido[["cpf"]]
pedido[1]
pedido[[2]]
pedido["nome"]
