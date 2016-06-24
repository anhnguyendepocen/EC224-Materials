da <- read.csv("Assignment/Assignment2016Data.csv", stringsAsFactors = FALSE)
da$Total <- da[,5]*0.25 + da[,10] * 0.25 + da[, 11] * 0.5
head(da)
str(da)
print.data.frame(da, row.names = FALSE, digits = 1)
#----------------------------------------------------
  myStats <- function(x, na.omit=FALSE){
    if (na.omit)
      x <- x[!is.na(x)]
    m <- mean(x)
    md <- median(x)
    s <- sd(x) 
    max <- max(x)
    min <- min(x)
    n <- length(x)
    return(c(n=n, mean=m, median = md, stdev=s, max = max, min = min))
  }
    Stats <- apply(da[,c(5, 10, 11, 12)], 2, FUN = myStats, na.omit = TRUE)
  round(Stats, 2)
#-----------------------------------------------------
first <- sum(da$Total >= 70, na.rm = TRUE)
twoone <- sum(da$Total >= 60 & da$Total < 70, na.rm = TRUE)
twotwo <- sum(da$Total >= 50 & da$Total < 60, na.rm = TRUE)
third <- sum(da$Total >= 40 & da$Total < 50, na.rm = TRUE)
pass <- sum(da$Total >= 30 & da$Total < 40, na.rm = TRUE)
fail <- sum(da$Total < 30, na.rm = TRUE)
# Use matrix so that colum names can be set.
Results <- matrix(c(first, twoone, twotwo, third, pass, fail), nrow = 1)
colnames(Results) <- c("First", "2:1", "2:2", "3", "P", "F")
Results
#--------------------------------------------------------
hist(da$Total, main = "Distribution of EC381 Grades", col = "lightblue", xlab = "Final Grade")


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

