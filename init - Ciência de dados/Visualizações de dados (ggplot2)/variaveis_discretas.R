# Escalas
# Variáveis discretas

ggplot(Default,
       aes(x = default,
          y = balance)) +
  geom_boxplot() +
  scale_x_discrete("Calote",
                   labels = c("Não", "Sim")) +
  labs(y = "Valor devido médio após o pagamento mensal")


# Argumento - limits
ggplot(Default,
       aes(x = default,
           y = balance)) +
  geom_boxplot() +
  scale_x_discrete("Calote",
                   limits = c("Yes", "No"),
                   labels = c("Sim", "Não")) +
  labs(y = "Valor devido médio após o pagamento mensal")