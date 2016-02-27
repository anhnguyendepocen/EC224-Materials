da <- read.csv("Assignment/Assignment2016Data.csv", stringsAsFactors = FALSE)
head(da)
str(da)
# in case I use lower case. 
da$Self_select <- gsub("yes","Yes", da$Self_select)
da$Self_select <- gsub("no","No", da$Self_select)
par(mfrow = c(1, 1))
boxplot(subset(da[,5], da[,7] == 'Yes'), subset(da[,5], da[,7] == 'No'), names = c("Yes", "No"), main = "Distribution of 
        in-class test grades for those that did pick their own country and those that did not")


