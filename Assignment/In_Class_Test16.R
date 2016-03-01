da <- read.csv("Assignment/Assignment2016Data.csv", stringsAsFactors = FALSE)
head(da)
str(da)
# in case I use lower case. 
da$Self_select <- gsub("yes","Yes", da$Self_select)
da$Self_select <- gsub("no","No", da$Self_select)
par(mfrow = c(1, 1))
boxplot(subset(da[,5], da[,7] == 'Yes'), subset(da[,5], da[,7] == 'No'), names = c("Yes", "No"), main = "Distribution of 
        in-class test grades for those that did pick their own country and those that did not")
boxplot(subset(da[,5], da[,8] == 0), subset(da[,5], da[,8] == 1), subset(da[,5], da[,8] == 2), subset(da[,5], da[,8] == 3), 
                      subset(da[,5], da[,8] == 4), names = c(0, 1, 2, 3, 4), main = "Grade and seminar attendance (out of 4)")
length(da[subset(da[,7] == 'Yes'),])
dim(subset(da, da[,7] == 'Yes'))[1]/dim(da)[1]
dim(subset(da, da[,7] == 'No'))[1]
dim(da)[1]
