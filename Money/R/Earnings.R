library(dplyr)
library(zoo)
library(lubridate)
names <- c("Date", "Earnings", "CPI")
da <- read.csv("Money/Data/Earnings2.csv", skip = 8, stringsAsFactors = FALSE)
names(da) <- names
da$Date <- as.yearmon(da$Date, format = "%Y %b")
# Need to remove the date column before converting to zoo so that the 
# numerics are not converted to characters
dat <- as.zoo(da[,2:3], order.by = da$Date)
# This function will aggregate to year. Comes from examples for aggregate
as.year <- function(x) as.numeric(floor(as.yearmon(x)))
daty <- aggregate(dat, as.year, mean, na.locf = FALSE)
daty <- aggregate(dat, as.year, mean, na.rm = TRUE)
# reduce to just recent data. row 38 is 2000. 
da2 <- data.frame(daty)

da2$Earningsb <- da2$Earnings/da2$Earnings[45]
da2$CPIb <-  da2$CPI/da2$CPI[45]
daty <- daty[45:52,]
plot(rownames(da2)[45:52], da2[45:52, 4], type = 'l', lty = 2, 
     xlab = "Date", ylab = "Index: 1 2000")
lines(rownames(da2)[45:52], da2[45:52,3], type = 'l', col = 'Dark Green')
legend(legend = c("Earnings", "Consumer Prices"), 
       "topleft", col = c('black', 'Dark Green'), lty = c(1, 2))
# Find row for 2007.
da2[52,]

tail(da2)
str(da2)           
daty$Earningsb

da <- da %>%
  mutate(Earningsb = Earnings/Earnings[536], CPIb = CPI/CPI[536])
tail(da)
plot(da$Date[536:624], da$Earningsb[536:624], type = 'l')
lines(da$CPIb[536:624], type = 'l', col = 'red')
str(da$Date)

da[536,]
tail(da, 50)
str(dat)
str(xx)
yearmon
# Aggregate by year.  Using as.yearmon. Find this is F1 as.yearmon
# This works but da above does not
x <- as.yearmon(2000 + seq(0, 23)/12)
x
xx <- zoo(seq_along(x), x)
str(xx)
na.locf
## aggregating over year 
as.year <- function(x) as.numeric(floor(as.yearmon(x)))
aggregate(xx, as.year, mean)
str(x)
str(xx)
da
str(dat)
str(da)
