roots <- function(a, b, c){
  root1 <- (((b^2 - 4*a*c)^0.5 - b))/(2*a)
  root2 <- (((b^2 - 4*a*c)^0.5 + b))/(2*a)
  print(c(root1, root2))
}
roots(3, -20, -32)
roots(6, -30, -180)
roots(1, 30, 0)

