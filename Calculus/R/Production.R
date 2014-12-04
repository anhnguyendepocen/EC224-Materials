# Prodcuction TPP, AC and MC
L <- seq(0, 12, 1)
TPP = 25*L + 0.4*L^2 - 0.1 * L^3
plot(L, TPP, type = 'l', main = "TPP")
TC = 50 + 5*L
Q = TPP[1:10]
plot(L, TC, type = 'l', main = "Total cost")
plot(Q, TC[1:10], type = 'l')
AC = TC/TPP
plot(L, AC, type = 'l') 
plot(Q, AC[1:10], type = 'l')
MC = diff(TC)/diff(TPP)
plot(Q, MC[1:10], type = 'l')
lines(Q, AC[1:10], col = 'red')
da <- data.frame("L" = L[1:10], "TPP" = TPP[1:10], "TC" = TC[1:10], 
		"AC" = AC[1:10], "MC" = MC[1:10], "Q" = Q)
head(da,10)
 	