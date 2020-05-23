#@@@@@@@@@@@@@@@@@@@@@@#
# P-Q Slot Machines ####
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Several types of agents are simulated playing with two slot machines that give away 1$ in each round
# with p and q probability respectively. The assumption is that the agents don't know the p and q.
# In each round the agent can choose to play with machine 1 or 2. Agents want to pick strategies that 
# bring them maximum amount of money.
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# This code is developed by Mahdi Shafiei at 2020-05-22
# Github: qiisziilbash
# Copyleft


#@@@@@@@@@@@@@@@@@#
# requirements ####
#@@@@@@@@@@@@@@@@@#
library(plotly)
source('Agents/silly_goose.r')
source('Agents/smart_dog.r')

#@@@@@@@@@@@@@@@@@@@#
# initialization ####
#@@@@@@@@@@@@@@@@@@@#
# different reward probabilities for the M1 and M2
gc()
p <- seq(0, 1, by=.01)
q <- seq(0, 1, by=.01)

smart_dog_result <- run_smart_dog(p, q)
silly_goose_result <- run_silly_goose(p, q)


silly_goose_result
