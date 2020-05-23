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


#@@@@@@@@@@@@@@@@@@@#
# initialization ####
#@@@@@@@@@@@@@@@@@@@#
# different reward probabilities for the M1 and M2
p <- seq(0, 1, by=.01)
q <- seq(0, 1, by=.01)


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# silly_goose: Most naive agent ####
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# This agent picks a machine randomly in each round (picks the machines with same probality)

silly_goose_payoff <- function(p, q){
  payoff <- sapply(1:length(p),
                   function(i){
                     mean(c(p[i], q[i]))
                   }
                  )
  return (payoff)
}


silly_goose_result = outer(p, q, silly_goose_payoff)


# plot the payoff function for silly goose
fig <- plot_ly(x=p, y=q, z=silly_goose_result)
fig <- fig %>% add_surface(
  contours = list(
    z = list(
      show=TRUE,
      usecolormap=TRUE,
      highlightcolor="#ff0000",
      project=list(z=TRUE)
    )
  ),
)  

fig <- fig %>% layout(
  title = "Silly Goose Player",
  scene = list(
    xaxis = list(title = "P: M1 reward probablity"),
    yaxis = list(title = "Q: M2 reward probablity"),
    zaxis = list(title = "Payoff probablity")
  ))

fig


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# smart dog: Most smart agent ####
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# This agent reads slot machines minds and finds out the good machine in the very beginning and
# keeps playing with it forever

smart_dog_payoff <- function(p, q){
  payoff <- sapply(1:length(p),
                   function(i){
                     max(c(p[i], q[i]))
                   }
  )
  return (payoff)
}


smart_dog_result = outer(p, q, smart_dog_payoff)


# plot the payoff function for smart dog
figg <- plot_ly(x=p, y=q, z=silly_goose_result)
figg <- figg %>% add_surface(
  contours = list(
    z = list(
      show=TRUE,
      usecolormap=TRUE,
      highlightcolor="#ff0000",
      project=list(z=TRUE)
    )
  ),
)  

figg <- figg %>% layout(
  title = "Smart Dog Player",
  scene = list(
    xaxis = list(title = "P: M1 reward probablity"),
    yaxis = list(title = "Q: M2 reward probablity"),
    zaxis = list(title = "Payoff probablity")
  ))

figg
