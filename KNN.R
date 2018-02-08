if(!require(class))
  install.packages("class")

german <- read.csv(file.choose())     # locate the data file here.
apply(german,2,function(x) sum(is.na(x)))
class(german)
str(german)

set.seed(123)
n <- dim(german)[1]
samp <- sample(1:n, 0.8*n)
train <- german[samp, ]
test <- german[-samp, ]

library(class)
prediction1 <- knn(train, train, train[, 1], k=12)
result1 <- table(train[, 1], prediction1)
result1
error1<- sum(result1[1,2], result1[2,1])/sum(result1)
error1

prediction2 <- knn(train, test, train[, 1], k=12)
result2 <- table(test[, 1], prediction2)
result2
error2<- sum(result2[1,2], result2[2,1])/sum(result2)
error2
