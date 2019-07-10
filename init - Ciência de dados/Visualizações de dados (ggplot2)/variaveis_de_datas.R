# Variáveis de datas
ggplot(economics,
       aes(x = date,
           y = unemploy)) +
  geom_line()

# Alterando o formato da data
ggplot(economics,
       aes(x = date,
           y = unemploy)) +
  geom_line() +
  scale_x_date(date_labels = "%b/%Y")

?strptime

# date_breaks
ggplot(economics,
       aes(x = date,
           y = unemploy)) +
  geom_line() +
  scale_x_date(date_breaks = "5 years", date_labels = "%Y")
