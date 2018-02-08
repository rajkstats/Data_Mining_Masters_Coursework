if(!require(neuralnet))
  install.packages("neuralnet")

german <- read.csv(file.choose())   #locate the data file here.
apply(german,2,function(x) sum(is.na(x)))
class(german)
str(german)

set.seed(123)
maxs <- apply(german, 2, max) 
mins <- apply(german, 2, min)
scaled <- as.data.frame(scale(german, center = mins, scale = maxs - mins))
n <- dim(german)[1]
samp <- sample(1:n, 0.8*n)
train <- scaled[samp, ]
test <- scaled[-samp, ]

library(neuralnet)
name <- names(train)
f <- as.formula(paste("Creditability ~", paste(name[-1], collapse = " + ")))
creditnet <- neuralnet(f , data=train, hidden = 6, linear.output = FALSE)
plot(creditnet)

# Training Data:
res1 <- compute(creditnet, train[, -1])
result1 <- data.frame(actual=train[, 1], prediction=round(res1$net.result))
x <- table(result1)
x
error1<- sum(x[1,2], x[2,1])/sum(x)
error1

# Test Data:
res2 <- compute(creditnet, test[, -1])
result2 <- data.frame(actual=test[, 1], prediction=round(res2$net.result))
y <- table(result2)
y
error2<- sum(y[1,2], y[2,1])/sum(y)
error2
