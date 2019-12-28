library(ReinforcementLearning)

control <- list(alpha = 0.2, gamma = 0.4, epsilon = 0.1)
modelo_jogo <- ReinforcementLearning(
  tictactoe,
  s = "State",
  a = "Action",
  r = "Reward",
  s_new = "NextState",
  iter = 2,
  control = control
)
