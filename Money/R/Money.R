library(dplyr)
da <- read.csv("Money/Data/CPI_Ann.csv")
da <- da[,c("Date", "CDKO", "DOBH", "DOBP", "CZOG")]
# CZOG - bread
# CZOC - Flour
# CZOB = Butter
# CZNW =  Cheese
# CZNT - Milk
da <- da %>%
  mutate(CDKOl = lag(CDKO)) %>%
  mutate(CDKOd = log(CDKO) - log(CDKOl)) 
head(da)
str(da)
plot(da$Date, da$CDKO, type = 'l')
plot(da$Date[206:216], da$CDKO[206:216], type = 'l')
plot(da$Date[120:216], da$CZOG[120:216], type = 'l')
plot(da$Date, da$CDKOd, type = 'l')
abline(h = 0, col = "darkgreen")
