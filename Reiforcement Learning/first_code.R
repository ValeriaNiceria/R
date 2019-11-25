install.packages("ReinforcementLearning") # Instalando o pacote

library(ReinforcementLearning) # Carregando o pacote

ambiente <- gridworldEnvironment

print(ambiente)

estados <- c('s1', 's2', 's3', 's4')
acoes <- c('up', 'down', 'left', 'right')

dados <- sampleExperience(
  N = 1000, 
  env = ambiente, 
  states = estados,
  actions = acoes
)


modelo <- ReinforcementLearning(
 dados,
 s = "State",
 a = "Action",
 r = "Reward",
 s_new = "NextState",
 control = list(
   alpha = 0.1, 
   gamma = 0.5, 
   epsilon = 0.1
 )
)


modelo
computePolicy(modelo)
