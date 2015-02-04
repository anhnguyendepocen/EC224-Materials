library(tidyr)
library(dplyr)
names <- c("Country", "Series", "Units", "Notes", "Source", 1980:2014, "FC")
#class <- c(rep("character", 5), red("integer", 35))
# da <- read.csv("Assignment/Data/WEO.csv", colClasses = class)
da <- read.csv("Assignment/Data/WEO.csv", stringsAsFactors = FALSE)
names(da) <- names
da <- da[-c(73,74),c(1, 2, 3, 6:40)]
# get rid of comma for thousands
cols <- names[6:40]
for(i in cols){
  da[[i]] <- as.numeric(gsub(",","", da[[i]]))
}
head(da, 20)
da <- gather(da, Year, Data, 4:38, convert = TRUE)
da <- arrange(da, Country, Series)
# Next is to spread the two series to columns so that the data is tidy.
da <- spread(da, Series, Data)
# Create sumulative sums of strctural deficit and GDP.
da <- filter(da, Year == 2008| Year == 2009 | Year == 2010)
da <- mutate(da, DGDP = cumsum(da[,5]))
da <- mutate(da, Ddef = cumsum(da[,4]))
head(da, 30)
tail(da, 30)
das <- filter(da, Year == 2010)
& DGDP != NA & Ddef != NA)
head(das)
tail(das)
plot(das[,6], das[,7], xlab = "Structure Deficit", ylab = "Real GDP")
str(da)
da[,1]
