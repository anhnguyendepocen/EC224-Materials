library(RColorBrewer)
colors <- brewer.pal(n = 3, "Greens")
L = 0:10
K = 0:10
CD <- function(L, K){
  Z <- 2 * L^0.5 * K^0.5
  return(Z)
}
Z <- outer(K, L, CD)
persp(L, K, Z, theta = 30, phi = 20, col = colors, ltheta = 1, shade = 0.25, 
      xlab = "Labour", ylab = "Capital", zlab = "Output")
head(Z)
isoquant <- function(Q, K){
  L = Q^2/(A^2*K)
return(L)
  }
K = seq(0, 10, 1)
isoquant(Q = 6, K = K)
plot(K, L)

