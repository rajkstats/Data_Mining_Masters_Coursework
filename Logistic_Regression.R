german <- read.csv(file.choose()) # locate the data file here.
str(german)
apply(german,2,function(x) sum(is.na(x)))


set.seed(123)
n <- dim(german)[1]
samp <- sample(1:n, 0.8*n)
train <- german[samp, ]
test <- german[-samp, ]

model <- glm(Creditability ~., family = binomial, data=train)
summary(model)
sig.var<- summary(model)$coeff[-1,4] < 0.05
names(sig.var)[sig.var == T]

# Training Data:
pred1<- predict.glm(model, newdata = train, type = "response")
result1<- table(train[, 1], floor(pred1+0.5))
result1

error1<- sum(result1[1,2], result1[2,1])/sum(result1)
error1

# Test Data: 
pred2<- predict.glm(model, newdata = test, type = "response")
result2<- table(test[, 1], floor(pred2+0.5))
result2

error2<- sum(result2[1,2], result2[2,1])/sum(result2)
error2
