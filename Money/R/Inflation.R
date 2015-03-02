da <- read.csv("Money/Data/UKinf.csv", skip = 7, stringsAsFactors = FALSE)
names <- c("Date", "Interest_rate", "Inflation")
names(da) <- names
da$Date <- as.Date(da$Date, format = "%Y-%m-%d")
head(da)
tail(da)
str(da)
plot(da$Date, da$Interest_rate, type = 'l', main = "UK inflation and nominal 
     interest rate", ylab = "Pecentage change", xlab = "Date")
lines(da$Date, da$Inflation, type = 'l', col = "Darkgreen")
