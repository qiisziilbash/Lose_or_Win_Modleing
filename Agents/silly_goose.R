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

run_silly_goose <- function(p, q){
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
  
  return(fig)
}
