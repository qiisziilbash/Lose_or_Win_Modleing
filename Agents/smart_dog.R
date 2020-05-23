

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

run_smart_dog <- function(p, q){
  smart_dog_result = outer(p, q, smart_dog_payoff)
  
  
  # plot the payoff function for smart dog
  fig <- plot_ly(x=p, y=q, z=smart_dog_result)
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
    title = "Smart Dog Player",
    scene = list(
      xaxis = list(title = "P: M1 reward probablity"),
      yaxis = list(title = "Q: M2 reward probablity"),
      zaxis = list(title = "Payoff probablity")
    ))
  
  fig
  
  return(fig)
}
