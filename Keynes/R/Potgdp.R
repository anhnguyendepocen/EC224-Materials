library(dplyr)
names <- c("Date", "GDP", "PGDP")
da <- read.csv("Keynes/Data/USGDP.csv", skip = 11)
names(da) <- names
da$Date <- as.Date(da$Date, format = "%Y-%m-%d")
da <- da[97:272,-3]
head(da)
da$t <- seq(1:176)
eq1 <- lm(da$GDP ~ da$t + I(da$t^2))
plot(da$Date, da$GDP, type = 'l', xlab = "Date", ylab = "USD billion", main = "US GDP and potential: 1970 to 2014")
lines(da$Date, eq1$fitted.values, type = 'l', col = "Dark Green")
#-------------------------------------------------------
names <- c("Date", "GDP", "PGDP")
da2 <- read.csv("Keynes/Data/USGDP.csv", skip = 11)
names(da2) <- names
da2$Date <- as.Date(da2$Date, format = "%Y-%m-%d")
da2 <- da2[100:272,-3]
da2$t <- seq(1:173)
eq2 <- lm(da2$GDP ~ da2$t + I(da2$t^2))
eq2
names(eq2)
head(da2)
plot(da2$Date, da2$GDP, type = 'l', xlab = "Date", ylab = "USD billion", main = "US GDP and potential: 2000 to 2014")
lines(da2$Date, eq2$fitted.values, type = 'l', col = "Dark Green")
#---------------------------------------
da3 <- da2 %>%
  mutate(GDPL = lag(GDP)) %>%
  mutate(DGDP = (GDP/GDPL-1)) 
  plot(da3$Date, da3$DGDP, main = "GDP growth", type = 'l', main = 
         "US GDP growth", ylab = "Percentage change", xlab = "Date")
#--------------------  