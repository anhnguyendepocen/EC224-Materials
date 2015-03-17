require(dplyr)
names = c("Date", "Notes_coin", "Broad_money", "Nominal_GDP")
da <- read.csv("Finance/Data/GDPmoney.csv", skip = 4, stringsAsFactors = FALSE)
names(da)  <- names
da$Date <- as.Date(da$Date, format = "%d-%b-%y")
head(da)
str(da)
plot(da$Date, da[,2], type = 'l', main = "Growth in Notes and Coins", xlab = 
       "Date", ylab = "Millions of pounds")
plot(da$Date, da[,3], type = 'l', main = "Growth in broad money", xlab = 
       "Date", ylab = "Millions of pounds")
plot(da$Date, da[,4], type = 'l', main = "Growth in nominal GDP", xlab = 
       "Date", ylab = "Millions of pounds")
rebase <- function(x, n){
  r <- x/x[n]
}
da$RB_Notes <- rebase(da$Notes_coin, 1)
da$RB_Broad <- rebase(da$Broad_money, 1)
da$RB_GDP <- rebase(da$Nominal_GDP, 1)
plot(da$Date, da[,5], type = 'l', main = "Growth in Notes and Coins", xlab = 
       "Date", ylab = "Index: 100 = 1985")
lines(da$Date, da[,7], col = "red", lty = 2)
legend(legend = c("Notes and coins", "Nominal GDP"), "topleft", col = c('black', 'red'), 
       lty = c(1, 2))
plot(da$Date, da[,6], type = 'l', main = "Growth in broad money", xlab = 
       "Date", ylab = "Index: 100 = 1985")
lines(da$Date, da[,7], col = "red", lty = 2)
legend(legend = c("Broad Money", "Nominal GDP"), "topleft", col = c('black', 'red'), 
       lty = c(1, 2))
tail(da)
#===============================
# To get the line number for re-basing at the financial crisis. 
da[da$Date == "2007-09-30",]
da$RB_Notes_FC <- rebase(da$Notes_coin, 101)
da$RB_Broad_FC <- rebase(da$Broad_money, 101)
da$RB_GDP_FC <- rebase(da$Nominal_GDP, 101)
plot(da$Date[101:130], da[101:130,8], type = 'l', main = "Growth in Notes and Coins", xlab = 
       "Date", ylab = "Index: 100 = 1985")
lines(da$Date[101:130], da[101:130,10], col = "red", lty = 2)
legend(legend = c("Notes and coins", "Nominal GDP"), "topleft", col = c('black', 'red'), 
       lty = c(1, 2))
plot(da$Date[101:130], da[101:130,9], type = 'l', main = "Growth in broad money", xlab = 
       "Date", ylab = "Index: 100 = 1985")
lines(da$Date[101:130], da[101:130,10], col = "red", lty = 2)
legend(legend = c("Broad Money", "Nominal GDP"), "topleft", col = c('black', 'red'), 
       lty = c(1, 2))
